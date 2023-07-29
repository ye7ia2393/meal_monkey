import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_controller.dart';
import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20),
              vertical: screenHeight(30),
            ),
            children: [
              CustomText(
                text: tr('key_login'),
                fontSize: screenWidth(10),
                textColor: AppColors.mainGreyColor,
              ),
              (screenHeight(30)).ph,
              CustomText(
                text: tr('key_login_view_details'),
                textColor: AppColors.secondaryGreyColor,
              ),
              (screenHeight(50)).ph,
              CustomTextFormField(
                hintText: tr('key_email'),
                controller: controller.emailController,
                validator: (value) {
                  if (value!.isEmpty || !isVaildEmail(value)) {
                    return tr('key_email_validation');
                  }
                  return null;
                },
                fillColor: AppColors.fillGreyColor,
                hintTextColor: AppColors.placeholderGreyColor,
                keyboardType: TextInputType.emailAddress,
              ),
              (screenHeight(30)).ph,
              Obx(
                () => CustomTextFormField(
                  hintText: tr('key_password'),
                  controller: controller.passwordController,
                  validator: (value) {
                    if (value!.isEmpty || !isVaildPassword(value)) {
                      return tr('key_password_validation');
                    }
                    return null;
                  },
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.hidePassword(
                        controller.passwordVisible,
                        controller.passwordVisible.value,
                      );
                    },
                    child: controller.passwordVisible.value
                        ? Icon(
                            Icons.visibility,
                            color: AppColors.mainOrangeColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppColors.mainOrangeColor,
                          ),
                  ),
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.passwordVisible.value,
                ),
              ),
              (screenHeight(30)).ph,
              Obx(() {
                return controller.isLoading
                    ? SpinKitThreeBounce(
                        color: AppColors.mainOrangeColor,
                      )
                    : CustomButton(
                        text: tr('key_login'),
                        onPressed: () {
                          controller.login();
                        },
                      );
              }),
              (screenHeight(40)).ph,
              TextButton(
                onPressed: () {
                  Get.to(() => ResetPasswordView());
                },
                child: CustomText(
                  text: tr('key_forgot_password'),
                  textColor: AppColors.mainOrangeColor,
                ),
              ),
              (screenHeight(30)).ph,
              CustomText(
                text: tr('key_login_view_options'),
                textColor: AppColors.secondaryGreyColor,
              ),
              (screenHeight(30)).ph,
              CustomButton(
                text: tr('key_login_with_facebook'),
                imageName: 'ic_facebook',
                onPressed: () {},
                backgroundColor: AppColors.mainBlueColor,
              ),
              (screenHeight(30)).ph,
              CustomButton(
                text: tr('key_login_with_google'),
                imageName: 'ic_google_plus_logo',
                onPressed: () {},
                backgroundColor: AppColors.mainRedColor,
              ),
              (screenHeight(30)).ph,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: '${tr('key_login_view_no_account')} ',
                      textColor: AppColors.secondaryGreyColor,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(() => SignupView());
                      },
                      child: CustomText(
                        text: ' ${tr('key_signup')}',
                        textColor: AppColors.mainOrangeColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
