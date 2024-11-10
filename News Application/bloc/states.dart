abstract class appstates {}

class AppInitialState extends appstates {}

class AppChangeBottomNavigationBarState extends appstates {}
class GetBusinessDataSucessfulState extends appstates {}
class GetBusinessloadingState extends appstates {}

class GetBusinessDataerrorState extends appstates {
  late final String error;
  GetBusinessDataerrorState(this.error);



}
class GetBusinessDataState extends appstates {}
class GetsearchDataState extends appstates {}
class GetsearchloadingState extends appstates {}
class GetsearchDataerrorState extends appstates {
  late final String error;
  GetsearchDataerrorState(this.error);



}



class GetsportsDataSucessfulState extends appstates {}
class Getsearchdataloadingstate extends appstates {}
class GetsportsloadingState extends appstates {}


class GetsportsDataerrorState extends appstates {
  late final String error;
  GetsportsDataerrorState(this.error);


}
class GetscienceDataState extends appstates {}
class GetscienceDataSucessfulState extends appstates {}
class GetscienceloadingState extends appstates {}
class GetsearchDataSucessfulState extends appstates {}


class GetscienceDataerrorState extends appstates {
  late final String error;
  GetscienceDataerrorState(this.error);


}
class GetsscienceDataState extends appstates {}
class changeAppModeStatelight extends appstates {}
class changeAppModeStatedark extends appstates {}






