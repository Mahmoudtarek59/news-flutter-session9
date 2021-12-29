import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:news_peoject/shared/cashed_data/cash_data.dart';
import 'package:news_peoject/shared/constants.dart';
import 'package:news_peoject/ui/screens/main_screens/explore_screen.dart';
import 'package:news_peoject/ui/screens/main_screens/home_screen.dart';
import 'package:news_peoject/ui/screens/main_screens/source_screen.dart';
import 'package:news_peoject/ui/screens/main_screens/trending_screen.dart';

part 'app_controller_state.dart';

class AppControllerCubit extends Cubit<AppControllerState> with CashDataPref{
  AppControllerCubit() : super(AppControllerInitial());
  bool isDark = false;

  cubitInit()async{
    await init();
    isDark = getData(key: modeKey)??false;
    emit(AppControllerInitial());
  }

  changeAppMode(bool val) async{
    isDark = !isDark;
    await init();
    await putData(key: modeKey, value: isDark);
    emit(ChangeModeState());
  }

  int index = 0;
  List<BottomNavigationBarItem> btmItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_fire_department), label: "Trending"),
    BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Source"),
  ];
  List<Widget> screens = [
    HomeScreen(),
    ExploreScreen(),
    TrendingScreen(),
    SourceScreen()
  ];

  changeIndex(int index){
    this.index = index;
    emit(ChangeBTMIndexState());
  }
}
