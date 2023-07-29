// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/core/services/base_controller.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:meal_monkey/ui/views/new_password_view/new_password_view.dart';

// class VerificationCodeController extends BaseController {
//   int length = 4;
//   List<String> otpCode = [];
//   late List<Widget> otpList;
//   List<FocusNode> focusNodeList = List.generate(4, (index) => FocusNode());
//   List<TextEditingController> controllerList =
//       List.generate(4, (index) => TextEditingController());

//   void enterOTP(String value, int index) {
//     if (index != otpList.length - 1 && value.length == 1) {
//       // FocusScope.of(context).nextFocus();
//       FocusScope.of(context).requestFocus(focusNodeList[index + 1]);
//     }
//     saveDataToList(value, index);
//   }

//   void saveDataToList(String value, int index) {
//     if (index <= controllerList.length) {
//       otpCode.add(controllerList[index].text);
//     }
//   }

//   void sendData() {
//     if (otpCode.length == 4) {
//       CustomToast.showMessage(
//         message: 'OTP Correct',
//         messageType: MessageType.SUCCESS,
//       );
//       Future.delayed(Duration(seconds: 2)).then(
//         (value) => Get.off(() => NewPasswordView()),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controllerList.forEach((controller) => controller.dispose());
//     focusNodeList.forEach((node) => node.dispose());
//     super.dispose();
//   }
// }
