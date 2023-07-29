import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/file_type_model.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/file_type.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/core/utils/file_utils.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/views/login_view/login_view.dart';

class SignupController extends BaseController {
  TextEditingController firstnameController =
      TextEditingController(text: 'Yehia');
  TextEditingController lastnameController =
      TextEditingController(text: 'Al-Sabsabi');
  TextEditingController ageController = TextEditingController(text: '26');
  TextEditingController emailController =
      TextEditingController(text: 'Yehiasb@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@123');
  TextEditingController confirmPasswordController =
      TextEditingController(text: 'Test@123');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<FileTypeModel> selectedFile = FileTypeModel().obs;
  RxBool passwordVisible = false.obs;
  RxBool passwordConfirmationVisible = false.obs;

  void hidePassword(RxBool password, bool value) {
    password.value = !value;
  }

  // void register() {
  //   // isLoading.value = true;
  //   if (formKey.currentState!.validate()) {
  //     isLoading.value = true;
  //     UserRepository()
  //         .register(
  //           email: emailController.text,
  //           firstname: firstnameController.text,
  //           lastname: lastnameController.text,
  //           age: int.parse(ageController.text),
  //           password: passwordController.text,
  //           photoPath: selectedFile.value.path ?? '',
  //         )
  //         .then(
  //           (value) => value.fold(
  //             (l) {
  //               isLoading.value = false;

  //               CustomToast.showMessage(
  //                 messageType: MessageType.REJECTED,
  //                 message: l,
  //               );
  //             },
  //             (r) {
  //               Get.off(() => LoginView());
  //             },
  //           ),
  //         );
  //   } else {
  //     // isLoading.value = false;
  //     CustomToast.showMessage(
  //       message: tr('key_bot_toast_general_rejected'),
  //       messageType: MessageType.REJECTED,
  //     );
  //   }
  // }
  void register() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFunction(
        function: UserRepository()
            .register(
              email: emailController.text,
              firstname: firstnameController.text,
              lastname: lastnameController.text,
              age: int.parse(ageController.text),
              password: passwordController.text,
              photoPath: selectedFile.value.path ?? '',
            )
            .then(
              (value) => value.fold(
                (l) {
                  CustomToast.showMessage(
                    messageType: MessageType.REJECTED,
                    message: l,
                  );
                },
                (r) {
                  Get.off(() => LoginView());
                },
              ),
            ),
      );
    } else {
      CustomToast.showMessage(
        message: tr('key_bot_toast_general_rejected'),
        messageType: MessageType.REJECTED,
      );
    }
  }

  void showBottomSheet() {
    Get.bottomSheet(
      backgroundColor: AppColors.mainWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(20),
          topEnd: Radius.circular(20),
        ),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(
              Icons.camera_alt,
              color: AppColors.mainOrangeColor,
            ),
            title: CustomText(
              text: tr('key_camera'),
              textAlign: TextAlign.start,
            ),
            onTap: () {
              FileUtil.pickFile(FileTypeEnum.CAMERA).then(
                (value) => selectedFile.value = value,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.image,
              color: AppColors.mainOrangeColor,
            ),
            title: CustomText(
              text: tr('key_gallery'),
              textAlign: TextAlign.start,
            ),
            onTap: () {
              FileUtil.pickFile(FileTypeEnum.GALLERY).then(
                (value) => selectedFile.value = value,
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.file_open,
              color: AppColors.mainOrangeColor,
            ),
            title: CustomText(
              text: tr('key_file'),
              textAlign: TextAlign.start,
            ),
            onTap: () {
              FileUtil.pickFile(FileTypeEnum.FILE).then(
                (value) => selectedFile.value = value,
              );
            },
          )
        ],
      ),
    );
  }
}
