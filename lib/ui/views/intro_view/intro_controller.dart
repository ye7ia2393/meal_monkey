import 'package:get/get.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/views/landing_view/landing_view.dart';

class IntroController extends BaseController {
  String title = tr('key_intro_title_01');
  String description = tr('key_intro_description_01');
  List<String> titleList = [
    tr('key_intro_title_01'),
    tr('key_intro_title_02'),
    tr('key_intro_title_03'),
  ];
  List<String> descriptionList = [
    tr('key_intro_description_01'),
    tr('key_intro_description_02'),
    tr('key_intro_description_03'),
  ];
  RxInt currentIndex = 0.obs;

  void nextIntro() {
    if (currentIndex.value != 2) {
      // textList();
      currentIndex.value += 1;
    } else
      Get.off(() => LandingView());
  }

  // void textList() {
  //   if (currentIndex.value == 0) {
  //     title = tr('key_intro_title_01');
  //     description = tr('key_intro_description_01');
  //   } else if (currentIndex.value == 1) {
  //     title = tr('key_intro_title_02');
  //     description = tr('key_intro_description_02');
  //   } else if (currentIndex.value == 2) {
  //     title = tr('key_intro_title_03');
  //     description = tr('key_intro_description_03');
  //   }
  // }
}
