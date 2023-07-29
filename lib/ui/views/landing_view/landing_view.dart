import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/cutsom_app_language.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/map_view/map_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.mainWhiteColor,
        body: ListView(
          shrinkWrap: true,
          children: [
            Stack(
              children: [
                CustomPaint(
                  painter: _ClipShadowShadowPainter(
                    clipper: LandingClipper(),
                    shadow: Shadow(
                      blurRadius: 12,
                    ),
                  ),
                  child: ClipPath(
                    clipper: LandingClipper(),
                    child: Container(
                      width: screenWidth(1),
                      height: screenHeight(1.3),
                      decoration: BoxDecoration(
                        color: AppColors.mainOrangeColor,
                      ),
                      child: SvgPicture.asset(
                        'assets/images/background_objects.svg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight(3),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: screenWidth(2.6),
                      height: screenWidth(2.4),
                    ),
                  ),
                ),
              ],
            ),
            CustomAppLanguage(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenHeight(20),
              ),
              child: CustomText(
                text: tr('key_landing_view_description'),
                textColor: AppColors.secondaryGreyColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(15),
              ),
              child: Column(
                children: [
                  CustomButton(
                    text: tr('key_login'),
                    onPressed: () async {
                      LocationData? currentLocation =
                          await locationService.getUserCurrentLocation();
                      if (currentLocation != null)
                        Get.to(() => MapView(
                              currentLocation: currentLocation,
                            ));
                    },
                  ),
                  (screenWidth(20)).ph,
                  CustomButton(
                    text: tr('key_landing_view_create_account'),
                    textColor: AppColors.mainOrangeColor,
                    backgroundColor: AppColors.mainWhiteColor,
                    borderColor: AppColors.mainOrangeColor,
                    onPressed: () {
                      Get.to(() => SignupView());
                    },
                  ),
                  (screenWidth(20)).ph,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LandingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width, 0);
    path0.lineTo(0, 0);
    path0.quadraticBezierTo(
        0, size.height * 0.3959520, 0, size.height * 0.5279360);
    path0.cubicTo(
        size.width * -0.0001500,
        size.height * 0.5522720,
        size.width * 0.0034250,
        size.height * 0.5618880,
        size.width * 0.0488000,
        size.height * 0.5594080);
    path0.cubicTo(
        size.width * 0.1109750,
        size.height * 0.5595880,
        size.width * 0.2353250,
        size.height * 0.5599480,
        size.width * 0.2975000,
        size.height * 0.5601280);
    path0.cubicTo(
        size.width * 0.3109000,
        size.height * 0.5596000,
        size.width * 0.3205500,
        size.height * 0.5560960,
        size.width * 0.3206250,
        size.height * 0.5434080);
    path0.cubicTo(
        size.width * 0.3328250,
        size.height * 0.4923360,
        size.width * 0.3389500,
        size.height * 0.4070400,
        size.width * 0.5007000,
        size.height * 0.3988480);
    path0.cubicTo(
        size.width * 0.6604000,
        size.height * 0.4063680,
        size.width * 0.6637500,
        size.height * 0.4946080,
        size.width * 0.6743000,
        size.height * 0.5448320);
    path0.cubicTo(
        size.width * 0.6740750,
        size.height * 0.5578400,
        size.width * 0.6916750,
        size.height * 0.5601440,
        size.width * 0.7000000,
        size.height * 0.5603840);
    path0.cubicTo(
        size.width * 0.7628250,
        size.height * 0.5603160,
        size.width * 0.8830000,
        size.height * 0.5600320,
        size.width * 0.9513000,
        size.height * 0.5601120);
    path0.cubicTo(
        size.width * 0.9866750,
        size.height * 0.5594720,
        size.width * 1.0010000,
        size.height * 0.5583360,
        size.width,
        size.height * 0.5286080);
    path0.quadraticBezierTo(
        size.width * 1.0048000, size.height * 0.3926080, size.width, 0);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipShadowShadowPainter extends CustomPainter {
  final Shadow shadow;
  final CustomClipper<Path> clipper;

  _ClipShadowShadowPainter({required this.shadow, required this.clipper});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = shadow.toPaint();
    var clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
