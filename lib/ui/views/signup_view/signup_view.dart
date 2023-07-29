import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/enums/file_type.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';
import 'package:meal_monkey/ui/views/signup_view/signup_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  SignupController controller = SignupController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: Form(
          key: controller.formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: screenWidth(35),
              horizontal: screenWidth(18),
            ),
            shrinkWrap: true,
            children: [
              CustomText(
                text: tr('key_signup'),
                textColor: AppColors.mainGreyColor,
                fontSize: screenWidth(10),
              ),
              (screenHeight(65)).ph,
              CustomText(
                text: tr('key_signup_view_description'),
                textColor: AppColors.secondaryGreyColor,
              ),
              (screenHeight(65)).ph,
              Center(
                child: Obx(
                  () {
                    return Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        InkWell(
                          onTap: controller.selectedFile.value.path == null
                              ? () {
                                  controller.showBottomSheet();
                                }
                              : null,
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: controller.selectedFile.value.path == null ||
                                    controller.selectedFile.value.path!.isEmpty
                                ? Icon(
                                    Icons.image,
                                    color: AppColors.mainWhiteColor,
                                  )
                                : controller.selectedFile.value.type !=
                                        FileTypeEnum.FILE
                                    ? Image.file(
                                        File(
                                          controller.selectedFile.value.path!,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : Icon(
                                        Icons.file_copy,
                                        color: AppColors.mainWhiteColor,
                                      ),
                            width: (screenWidth(2.5)),
                            height: (screenWidth(3)),
                            decoration: BoxDecoration(
                              color: AppColors.mainOrangeColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: controller.selectedFile.value.path != null,
                          child: InkWell(
                            onTap: () {
                              controller.showBottomSheet();
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColors.mainOrangeColor.withOpacity(0.5),
                              child: Icon(
                                Icons.edit,
                                color:
                                    AppColors.mainWhiteColor.withOpacity(0.8),
                              ),
                              radius: screenWidth(15),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              (screenHeight(65)).ph,
              CustomTextFormField(
                hintText: tr('key_first_name'),
                controller: controller.firstnameController,
                validator: (value) {
                  if (value!.isEmpty || !isVaildName(value)) {
                    return tr('key_name_validation');
                  }
                  return null;
                },
                fillColor: AppColors.fillGreyColor,
                hintTextColor: AppColors.placeholderGreyColor,
                keyboardType: TextInputType.name,
              ),
              (screenHeight(65)).ph,
              CustomTextFormField(
                hintText: tr('key_last_name'),
                controller: controller.lastnameController,
                validator: (value) {
                  if (value!.isEmpty || !isVaildName(value)) {
                    return tr('key_name_validation');
                  }
                  return null;
                },
                fillColor: AppColors.fillGreyColor,
                hintTextColor: AppColors.placeholderGreyColor,
                keyboardType: TextInputType.name,
              ),
              (screenHeight(65)).ph,
              // CustomTextFormField(
              //   hintText: 'Mobile No',
              //   controller: mobileNoController,
              //   validator: (value) {
              //     if (value!.isEmpty || !isVaildMobileNo(value)) {
              //       return 'Please Enter a valid Mobile Number';
              //     }
              //     return null;
              //   },
              //   fillColor: AppColors.fillGreyColor,
              //   hintTextColor: AppColors.placeholderGreyColor,
              //   keyboardType: TextInputType.phone,
              // ),
              // (screenHeight(65)).ph,
              CustomTextFormField(
                hintText: tr('key_age'),
                controller: controller.ageController,
                validator: (value) {
                  if (value!.isEmpty || int.parse(value) < 18) {
                    return tr('key_age_validation');
                  }
                  return null;
                },
                fillColor: AppColors.fillGreyColor,
                hintTextColor: AppColors.placeholderGreyColor,
                keyboardType: TextInputType.text,
              ),
              (screenHeight(65)).ph,
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
              (screenHeight(65)).ph,
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
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.passwordVisible.value,
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
                ),
              ),
              (screenHeight(65)).ph,
              Obx(
                () => CustomTextFormField(
                  hintText: tr('key_confirm_password'),
                  controller: controller.confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty || !isVaildPassword(value)) {
                      return tr('key_password_validation');
                    } else if (controller.passwordController.text !=
                        controller.confirmPasswordController.text) {
                      return tr('key_confirm_password_validation');
                    }
                    return null;
                  },
                  fillColor: AppColors.fillGreyColor,
                  hintTextColor: AppColors.placeholderGreyColor,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.passwordConfirmationVisible.value,
                  suffixIcon: InkWell(
                    onTap: () {
                      controller.hidePassword(
                        controller.passwordConfirmationVisible,
                        controller.passwordConfirmationVisible.value,
                      );
                    },
                    child: controller.passwordConfirmationVisible.value
                        ? Icon(
                            Icons.visibility,
                            color: AppColors.mainOrangeColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: AppColors.mainOrangeColor,
                          ),
                  ),
                ),
              ),
              (screenHeight(65)).ph,
              Obx(
                () {
                  // return controller.isLoading.value
                  return controller.isLoading
                      ? SpinKitThreeBounce(
                          color: AppColors.mainOrangeColor,
                        )
                      : CustomButton(
                          text: tr('key_signup'),
                          onPressed: () {
                            controller.register();
                          },
                        );
                },
              ),
              (screenHeight(65)).ph,
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: '${tr('key_signup_view_have_account')} ',
                      textColor: AppColors.secondaryGreyColor,
                    ),
                    InkWell(
                      onTap: () {
                        Get.off(() => LoginView());
                      },
                      child: CustomText(
                        text: ' ${tr('key_login')}',
                        textColor: AppColors.mainOrangeColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
