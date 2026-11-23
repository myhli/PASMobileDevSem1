import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pas_mobiledev/menu/home_page.dart';
import 'package:pas_mobiledev/menu/history_page.dart';
import 'package:pas_mobiledev/menu/profile_page.dart';


class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
  }

  List<Widget> listPage = [
    HomePage(),
    HistoryPage(),
    ProfilePage(),
  ];
}