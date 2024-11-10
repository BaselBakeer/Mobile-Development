

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/bloc/states.dart';
import 'package:newsapp/shared/network%20remote/dio_helper.dart';
import '../modules/business screen/businessScreen.dart';
import '../modules/science screen/scienceScreen.dart';
import '../modules/sports screen/sportsScreen.dart';

class AppCubit extends Cubit<appstates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<String> titles = ["Business", "sports", "Science", "Settings"];
  List<Widget> Screens = [
    businessScreen(),
    Sportsscreen(),

    scienceScreen(),



  ];
  int currentindex = 0;

  void changeIndex(int index) {
    currentindex = index;
    if (currentindex==1){
      getsportsData();
      emit(AppChangeBottomNavigationBarState());
    }else if (currentindex==2) {
      getscienceData();
      emit(AppChangeBottomNavigationBarState());
    }else if (currentindex==0) {
      getBusinessData();
      emit(AppChangeBottomNavigationBarState());
    }
  }

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: " Business",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: "Science",
    ),
  ];
  List< dynamic> business = [];
  void getBusinessData(){
    emit(GetBusinessloadingState());
    if(business.isEmpty)
    {
      DioHelper.getData(
          url: "v2/top-headlines",
          query: {
            'country':'us',
            'category':'business',
            'apiKey':'39721576109c4a2c847640f5f6f82dac'
          }).then((value)
      {
        business=value.data['articles'];
        emit(GetBusinessDataSucessfulState());

      }).catchError((error)
      {
        print("Error is ${error.toString()}");
        emit(GetBusinessDataerrorState(error.toString()));
      });
    }else{
      emit(GetsportsDataSucessfulState());
    }

  }

  List< dynamic> sports = [];
  void getsportsData(){
    emit(GetsportsloadingState());
    if (sports.isEmpty)
    {
      DioHelper.getData(
          url: "v2/top-headlines",
          query: {
            'country':'us',
            'category':'sports',
            'apiKey':'39721576109c4a2c847640f5f6f82dac'
          }).then((value)
      {
        sports=value.data['articles'];
        emit(GetsportsDataSucessfulState());

      }).catchError((error)
      {
        print("Error is ${error.toString()}");
        emit(GetsportsDataerrorState(error.toString()));
      });
    }else{
      emit(GetsportsDataSucessfulState());
    }


  }
  List< dynamic> science = [];
  void getscienceData(){
    emit(GetscienceloadingState());
    if(science.isEmpty)
    {
      DioHelper.getData(
          url: "v2/top-headlines",
          query: {
            'country':'us',
            'category':'science',
            'apiKey':'39721576109c4a2c847640f5f6f82dac'
          }).then((value)
      {
        science=value.data['articles'];
        emit(GetscienceDataSucessfulState());

      }).catchError((error)
      {
        print("Error is ${error.toString()}");
        emit(GetscienceDataerrorState(error.toString()));
      });
    }else{
      emit(GetscienceDataSucessfulState());
    }


  }

  bool islight = true;

  void changeAppMode() {
    islight = !islight;
    if (islight) {
      emit(changeAppModeStatelight());
    } else {
      emit(changeAppModeStatedark());
    }

    print("Theme Mode Changed: $islight");
  }
  List< dynamic> search = [];
  void getsearchData(String data) {
    DioHelper.getData(
      url: "v2/everything",
      query: {
        'q': '${data}',
        'apiKey': '39721576109c4a2c847640f5f6f82dac',
      },
    ).then((value) {
      search = value.data['articles'];
      print("Search results: $search"); // Debugging line
      emit(GetsearchDataSucessfulState());
    }).catchError((error) {
      print("Error is ${error.toString()}");
      emit(GetsearchDataerrorState(error.toString()));
    });
  }




  }



