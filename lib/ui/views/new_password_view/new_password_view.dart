import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';
import 'package:meal_monkey/ui/views/new_password_view/new_password_controller.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({super.key});

  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  NewPasswordController controller = Get.put(NewPasswordController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(40),
            ),
            child: Center(
              child: Column(
                children: [
                  CustomText(
                    text: tr('key_new_password'),
                    textColor: AppColors.mainGreyColor,
                    fontSize: screenWidth(10),
                  ),
                  (screenHeight(80)).ph,
                  CustomText(
                    text: tr('key_new_password_view_description'),
                    textColor: AppColors.secondaryGreyColor,
                  ),
                  (screenHeight(15)).ph,
                  CustomTextFormField(
                    hintText: tr('key_new_password'),
                    controller: controller.newPasswordController,
                    validator: (value) {
                      if (value!.isEmpty || !isVaildPassword(value)) {
                        return tr('key_password_validation');
                      }
                      return null;
                    },
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  (screenHeight(20)).ph,
                  CustomTextFormField(
                    hintText: tr('key_confirm_password'),
                    controller: controller.confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty || !isVaildPassword(value)) {
                        return tr('key_password_validation');
                      }
                      if (controller.newPasswordController.value !=
                          controller.confirmPasswordController.value) {
                        return tr('key_confirm_password_validation');
                      }
                      return null;
                    },
                    fillColor: AppColors.fillGreyColor,
                    hintTextColor: AppColors.placeholderGreyColor,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  (screenHeight(20)).ph,
                  CustomButton(
                    text: tr('key_next'),
                    onPressed: () {
                      Get.off(() => LoginView());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
