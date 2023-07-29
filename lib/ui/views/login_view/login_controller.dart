import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/repositories/user_repository.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class LoginController extends BaseController {
  TextEditingController emailController =
      TextEditingController(text: 'Test@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'Test@1234');

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool passwordVisible = false.obs;

  void hidePassword(RxBool password, bool value) {
    password.value = !value;
  }

  // bool get isLoginLoading =>
  //     requestStatus == RequestStatus.LOADING &&
  //     operationTypeList.contains(OperationType.NONE);
  // operationType == OperationType.CATEGORY;

  // void login() {
  //   if (formKey.currentState!.validate()) {
  //     runFutureFunctionWithLoading(
  //       function: UserRepository()
  //           .login(
  //         email: emailController.text,
  //         password: passwordController.text,
  //       )
  //           .then((value) {
  //         value.fold((l) {
  //           CustomToast.showMessage(
  //             messageType: MessageType.REJECTED,
  //             message: l,
  //           );
  //         }, (r) {
  //           storage.setTokenInfo(r);
  //           //SharedPrefrenceRepository.setLoggedIn(true);
  //           Get.off(() => MainView());
  //         });
  //       }),
  //     );

  //     CustomToast.showMessage(
  //       message: tr('key_bot_toast_general_success'),
  //       messageType: MessageType.SUCCESS,
  //     );
  //   } else {
  //     CustomToast.showMessage(
  //       message: tr('key_bot_toast_general_rejected'),
  //       messageType: MessageType.REJECTED,
  //     );
  //   }
  // }
  void login() {
    if (formKey.currentState!.validate()) {
      runFullLoadingFunction(
        function: UserRepository()
            .login(
          email: emailController.text,
          password: passwordController.text,
        )
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
              messageType: MessageType.REJECTED,
              message: l,
            );
          }, (r) {
            storage.setTokenInfo(r);
            //SharedPrefrenceRepository.setLoggedIn(true);
            Get.off(() => MainView());
          });
        }),
      );

      CustomToast.showMessage(
        message: tr('key_bot_toast_general_success'),
        messageType: MessageType.SUCCESS,
      );
    } else {
      CustomToast.showMessage(
        message: tr('key_bot_toast_general_rejected'),
        messageType: MessageType.REJECTED,
      );
    }
  }

  // void login() {

  //   isLoading.value = true;
  //   if (formKey.currentState!.validate()) {
  //     isLoading.value = true;
  //     UserRepository()
  //         .login(
  //       email: emailController.text,
  //       password: passwordController.text,
  //     )
  //         .then((value) {
  //       value.fold((l) {
  //         isLoading.value = false;
  //         CustomToast.showMessage(
  //           messageType: MessageType.REJECTED,
  //           message: l,
  //         );
  //       }, (r) {
  //         storage.setTokenInfo(r);
  //         //SharedPrefrenceRepository.setLoggedIn(true);
  //         Get.off(() => MainView());
  //       });
  //     });

  //     CustomToast.showMessage(
  //       message: tr('key_bot_toast_general_success'),
  //       messageType: MessageType.SUCCESS,
  //     );
  //   } else {
  //     // isLoading.value = false;
  //     CustomToast.showMessage(
  //       message: tr('key_bot_toast_general_rejected'),
  //       messageType: MessageType.REJECTED,
  //     );
  //   }
  // }
}
