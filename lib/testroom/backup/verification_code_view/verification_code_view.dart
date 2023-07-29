// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/core/translation/app_translation.dart';
// import 'package:meal_monkey/ui/shared/colors.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:meal_monkey/ui/shared/utils.dart';
// import 'package:meal_monkey/ui/views/new_password_view/new_password_view.dart';
// import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
// import 'package:meal_monkey/ui/views/verification_code_view/verification_code_controller.dart';
// import 'package:meal_monkey/ui/views/verification_code_view/verification_code_view_widgets/verification_code_view_text_form_field.dart';

// class VerificationCodeView extends StatefulWidget {
//   const VerificationCodeView({super.key});

//   @override
//   State<VerificationCodeView> createState() => _VerificationCodeViewState();
// }

// class _VerificationCodeViewState extends State<VerificationCodeView> {
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

//   VerificationCodeController controller = Get.put(VerificationCodeController());
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(
//             vertical: screenHeight(40),
//             // horizontal: size.width * 0.01,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 CustomText(
//                   text: tr('key_verification_code_view_title'),
//                   textColor: AppColors.mainGreyColor,
//                   fontSize: screenHeight(23),
//                 ),
//                 (screenHeight(60)).ph,
//                 CustomText(
//                   text: tr('key_verification_code_view_description'),
//                   textColor: AppColors.secondaryGreyColor,
//                 ),
//                 (screenHeight(10)).ph,
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: otpList = List.generate(
//                     length,
//                     (index) => OneTimePasscodeTextFormField(
//                       fillColor: AppColors.fillGreyColor,
//                       hintTextColor: AppColors.placeholderGreyColor,
//                       focusNode: focusNodeList[index],
//                       autoFocus: index == 0 ? true : false,
//                       controller: controllerList[index],
//                       obscureText: true,
//                       onChanged: (value) {
//                         enterOTP(value, index);
//                         sendData();
//                       },
//                     ),
//                   ),
//                 ),
//                 (screenHeight(15)).ph,
//                 Text(
//                     '${tr('key_verification_code_view_your_code_is')} : ${otpCode.join()} '),
//                 (screenHeight(15)).ph,
//                 CustomButton(
//                   text: tr('key_next'),
//                   onPressed: () {},
//                 ),
//                 (screenHeight(30)).ph,
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomText(
//                         text: tr('key_verification_code_view_no_code'),
//                         textColor: AppColors.secondaryGreyColor,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           Get.to(() => ResetPasswordView());
//                         },
//                         child: CustomText(
//                           text: tr('key_click_here'),
//                           textColor: AppColors.mainOrangeColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
