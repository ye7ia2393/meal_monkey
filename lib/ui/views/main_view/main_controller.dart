import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/enums/bottom_navigation.dart';
import 'package:meal_monkey/core/services/base_controller.dart';

class MainController extends BaseController {
  Rx<BottomNavigationEnum> selectedPage = BottomNavigationEnum.HOME.obs;
  PageController pageController = PageController(initialPage: 2);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void pageNavigation(BottomNavigationEnum selectedEnum, int pageNumber) {
    pageController.animateToPage(
      pageNumber,
      duration: Duration(
        microseconds: 500,
      ),
      curve: Curves.easeInCirc,
    );
    selectedPage.value = selectedEnum;
  }
}
