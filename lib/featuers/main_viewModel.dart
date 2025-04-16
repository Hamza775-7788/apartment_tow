import 'package:apartment_tow/featuers/home/views/abut_viewPage.dart';
import 'package:apartment_tow/featuers/home/views/apartment_view.dart';
import 'package:apartment_tow/featuers/home/views/search_view.dart';
import 'package:apartment_tow/featuers/profile/presntaion/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainViewModel {
  int selectedPage = 0;

  List<Widget> pages = [
    HomeViewPage(),
    SearchView(),
    AbutViewpage(),
    SettingView(),
  ];
  String homeLabel = "الرئيسية".tr;
  String hartLable = "المفضلة".tr;
  String categorylabel = "بحث".tr;
  String offersLabel = "عنا".tr;
  String more = "العدادات".tr;
}
