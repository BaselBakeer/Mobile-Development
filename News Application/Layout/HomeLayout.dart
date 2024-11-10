

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/SearchScreen/searchscreen.dart';


import '../bloc/cubit.dart';
import '../bloc/states.dart';
import '../shared/components/components.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, appstates>(
      listener: (context, state) {
        // Add any listener actions here if needed
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(

          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentindex],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,

              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: () {
                  NavigateTo(context, Searchscreen());
                },
              ),
              IconButton(
                icon: const Icon(
                  Icons.brightness_4,
                ),
                onPressed: ()
                {
                  cubit.changeAppMode();
                },
              ),
            ],
          ),

          body: cubit.Screens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: cubit.bottomItems,
            currentIndex: cubit.currentindex,
          ),
        );
      },
    );
  }
}