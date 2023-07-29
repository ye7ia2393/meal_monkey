// import 'package:flutter/material.dart';
// import 'package:meal_monkey/data/enums/message_type.dart';
// import 'package:meal_monkey/ui/shared/colors.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:meal_monkey/ui/views/new_password_view/new_password_view.dart';
// import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class VerificationCodeView extends StatefulWidget {
//   const VerificationCodeView({super.key});

//   @override
//   State<VerificationCodeView> createState() => _VerificationCodeViewState();
// }

// class _VerificationCodeViewState extends State<VerificationCodeView> {
//   TextEditingController textEditingController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void sendData(String value, Size size) {
//     if (value.length == 4) {
//       CustomToast.showMessage(
//         size: size,
//         message: 'Pin Code Package Working!',
//         messageType: MessageType.SUCCESS,
//       );
//       Future.delayed(Duration(seconds: 3)).then(
//         (value) => Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => NewPasswordView(),
//           ),
//         ),
//       );
//     }
//   }
//   // if (value.length == 4) {
//   //   Navigator.pushReplacement(
//   //     context,
//   //     MaterialPageRoute(
//   //       builder: (context) => NewPasswordView(),
//   //     ),
//   //   );
//   // }

//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               vertical: size.height * 0.03,
//               // horizontal: size.width * 0.01,
//             ),
//             child: Column(
//               children: [
//                 MyCustomText(
//                   myText: 'We have Sent an OTP to \n your Mobile',
//                   myTextColor: AppColors.mainGreyColor,
//                   fontSize: size.width * 0.08,
//                 ),
//                 (size.height * 0.02).ph,
//                 MyCustomText(
//                   myText:
//                       'Please check your mobile number \n continue to reset your password',
//                   myTextColor: AppColors.secondaryGreyColor,
//                 ),
//                 (size.height * 0.08).ph,
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
//                   child: PinCodeTextField(
//                     autoFocus: true,
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     hintCharacter: '*',
//                     hintStyle: TextStyle(
//                       color: AppColors.placeholderGreyColor,
//                     ),
//                     length: 4,
//                     controller: textEditingController,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter your OTP';
//                       }
//                       return null;
//                     },
//                     obscureText: true,
//                     obscuringCharacter: "*",
//                     blinkWhenObscuring: true,
//                     animationType: AnimationType.fade,
//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.box,
//                       borderRadius: BorderRadius.circular(15),
//                       fieldHeight: size.width * 0.15,
//                       fieldWidth: size.width * 0.15,
//                       selectedColor: AppColors.fillGreyColor,
//                       selectedFillColor: AppColors.fillGreyColor,
//                       activeColor: AppColors.fillGreyColor,
//                       activeFillColor: AppColors.fillGreyColor,
//                       inactiveColor: AppColors.fillGreyColor,
//                       inactiveFillColor: AppColors.fillGreyColor,
//                     ),
//                     animationDuration: Duration(milliseconds: 300),
//                     // backgroundColor: AppColors.mainWhiteColor,
//                     cursorColor: AppColors.mainGreyColor,
//                     keyboardType: TextInputType.number,
//                     enableActiveFill: true,
//                     // onCompleted: (v) {
//                     //   sendData(v, size);
//                     //   print("Completed");
//                     // },
//                     onChanged: (value) {
//                       print(value);
//                     },
//                     beforeTextPaste: (text) {
//                       print("Allowing to paste $text");
//                       //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
//                       //but you can show anything you want here, like your pop up saying wrong paste format or etc
//                       return true;
//                     },
//                     appContext: context,
//                   ),
//                 ),
//                 (size.height * 0.06).ph,
//                 CustomButton(
//                   myButtonText: 'Next',
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       Navigator.pushReplacement(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return NewPasswordView();
//                           },
//                         ),
//                       );
//                     }
//                   },
//                 ),
//                 (size.height * 0.04).ph,
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       MyCustomText(
//                         myText: 'Didn\'t Receive?',
//                         myTextColor: AppColors.secondaryGreyColor,
//                       ),
//                       TextButton(
//                         onPressed: () {
//                           context.push(ResetPasswordView());
//                         },
//                         child: MyCustomText(
//                           myText: 'Click Here',
//                           myTextColor: AppColors.mainOrangeColor,
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
