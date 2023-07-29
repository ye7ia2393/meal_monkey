import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/cutsom_app_language.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/intro_view/intro_controller.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  IntroController controller = Get.put(IntroController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Obx(
            () {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    (screenWidth(11)).ph,
                    CustomAppLanguage(extraFunction: () {
                      controller.titleList = [
                        tr('key_intro_title_01'),
                        tr('key_intro_title_02'),
                        tr('key_intro_title_03'),
                      ];
                      controller.descriptionList = [
                        tr('key_intro_description_01'),
                        tr('key_intro_description_02'),
                        tr('key_intro_description_03'),
                      ];
                    }),
                    (screenWidth(11)).ph,
                    SvgPicture.asset(
                      'assets/images/intro${controller.currentIndex.value}.svg',
                      height: screenWidth(1.25),
                      width: screenWidth(1.25),
                    ),
                    (screenWidth(20)).ph,
                    DotsIndicator(
                      dotsCount: 3,
                      position: controller.currentIndex.value.toDouble(),
                      decorator: DotsDecorator(
                        spacing: EdgeInsets.symmetric(horizontal: 4),
                        color: AppColors.dropShadowColor,
                        activeColor: AppColors.mainOrangeColor,
                      ),
                    ),
                    (screenWidth(11)).ph,
                    CustomText(
                      text: controller.titleList[controller.currentIndex.value],
                      // text: controller.title,
                      fontSize: screenWidth(13),
                      textColor: AppColors.mainGreyColor,
                    ),
                    (screenWidth(11)).ph,
                    CustomText(
                      text: controller
                          .descriptionList[controller.currentIndex.value],
                      // text: controller.description,
                      textColor: AppColors.secondaryGreyColor,
                    ),
                    (screenWidth(11)).ph,
                    CustomButton(
                      text: controller.currentIndex.value != 2
                          ? tr('key_next')
                          : tr('key_finish'),
                      onPressed: () {
                        controller.nextIntro();

                        // if (controller.currentIndex.value != 2) {
                        //   setState(() {
                        //     controller.currentIndex.value += 1;
                        //   });
                        // } else
                        //   Get.off(() => LandingView());
                      },
                    ),
                    (screenWidth(11)).ph,
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
