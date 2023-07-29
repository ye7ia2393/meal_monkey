import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_drawer.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/main_view/home_view/home_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_controller.dart';
import 'package:meal_monkey/ui/views/main_view/main_view_widgets/bottom_navigation_widget.dart';
import 'package:meal_monkey/ui/views/main_view/menu_view/menu_view.dart';
import 'package:meal_monkey/ui/views/main_view/more_view/more_view.dart';
import 'package:meal_monkey/ui/views/main_view/offers_view/offers_view.dart';
import 'package:meal_monkey/ui/views/main_view/profile_view/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  MainController controller = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: controller.scaffoldKey,
        drawer: CustomDrawer(
          drawerWidth: screenWidth(2),
        ),
        body: Obx(
          () {
            return Stack(
              children: [
                PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  children: [
                    MenuView(),
                    OffersView(),
                    HomeView(
                      onMenuTap: () {
                        controller.scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                    ProfileView(),
                    MoreView(),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  child: BottomNavigationWidget(
                    bottomNavigationEnum: controller.selectedPage.value,
                    onTap: (selectedEnum, pageNumber) {
                      controller.pageNavigation(selectedEnum, pageNumber);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
