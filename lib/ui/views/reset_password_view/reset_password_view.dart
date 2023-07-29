import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/reset_password_view/reset_password_controller.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  ResetPasswordController controller = Get.put(ResetPasswordController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight(30),
              // horizontal: size.width * 0.01,
            ),
            child: Center(
              child: Column(
                children: [
                  CustomText(
                    text: 'Reset Password',
                    textColor: AppColors.mainGreyColor,
                    fontSize: screenWidth(10),
                  ),
                  (screenHeight(20)).ph,
                  CustomText(
                    text: tr('key_reset_password_view_description'),
                    textColor: AppColors.secondaryGreyColor,
                  ),
                  (screenHeight(10)).ph,
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
                  (screenHeight(20)).ph,
                  CustomButton(
                    text: tr('key_send'),
                    onPressed: () {
                      // Get.off(() => VerificationCodeView());
                      // if (controller.formKey.currentState!.validate()) {
                      //   Get.off(() => VerificationCodeView());
                      // } else {
                      //   CustomToast.showMessage(
                      //     message: 'Error while connecting to server',
                      //     messageType: MessageType.REJECTED,
                      //   );
                      // }
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
