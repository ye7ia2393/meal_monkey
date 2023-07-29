import 'package:get/get.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/intro_view/intro_view.dart';
import 'package:meal_monkey/ui/views/landing_view/landing_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class SplashScreenController extends BaseController {
  @override
  void onInit() {
    Future.delayed(
      Duration(seconds: 4),
    ).then(
      (value) {
        if (storage.getFirstLaunch() && storage.getTokenInfo() == null) {
          Get.off(() => IntroView());
        } else
          Get.off(
            () => storage.isLoggedIn ? MainView() : LandingView(),
          );

        storage.setFirstLaunch(false);
      },
    );
    super.onInit();
  }
}
