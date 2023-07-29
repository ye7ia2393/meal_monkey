// import 'package:flutter/material.dart';
// import 'package:meal_monkey/ui/shared/colors.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
// import 'package:meal_monkey/ui/shared/utils.dart';
// import 'package:meal_monkey/ui/views/reset_password_view/reset_password_view.dart';
// import 'package:meal_monkey/ui/views/signup_view/signup_view.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
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
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 CustomText(
//                   text: 'Login',
//                   fontSize: size.width * 0.1,
//                   textColor: AppColors.mainGreyColor,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomText(
//                   text: 'Add your details to login',
//                   textColor: AppColors.secondaryGreyColor,
//                 ),
//                 (size.height * 0.04).ph,
//                 CustomTextFormField(
//                   hintText: 'Your Email',
//                   controller: emailController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildEmail(value)) {
//                       return 'Please enter a valid email';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Password',
//                   controller: passwordController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildPassword(value)) {
//                       return 'Please enter a valid password';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomButton(
//                   text: 'Login',
//                   onPressed: () {
//                     // if (_formKey.currentState!.validate()) {}

//                     if (emailController.text.isEmpty) {
//                       print('Please enter your email');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Please enter your email')),
//                       );
//                     } else if (passwordController.text.isEmpty) {
//                       print('Please enter your password');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Please enter your password')),
//                       );
//                     } else if (!isVaildEmail(emailController.text)) {
//                       print('email is not valid');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('email is not valid')),
//                       );
//                     } else if (!isVaildPassword(passwordController.text)) {
//                       print('password is not valid');
//                       ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('password is not valid')));
//                     }
//                   },
//                 ),
//                 (size.height * 0.02).ph,
//                 TextButton(
//                   onPressed: () {
//                     context.push(ResetPasswordView());
//                   },
//                   child: CustomText(
//                     text: 'Forgot your password?',
//                     textColor: AppColors.mainOrangeColor,
//                   ),
//                 ),
//                 (size.height * 0.04).ph,
//                 CustomText(
//                   text: 'or Login With',
//                   textColor: AppColors.secondaryGreyColor,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomButton(
//                   text: 'Login with Facebook',
//                   imageName: 'ic_facebook',
//                   onPressed: () {},
//                   backgroundColor: AppColors.mainBlueColor,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomButton(
//                   text: 'Login with Google',
//                   imageName: 'ic_google_plus_logo',
//                   onPressed: () {},
//                   backgroundColor: AppColors.mainRedColor,
//                 ),
//                 Spacer(),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomText(
//                         text: 'Don\'t have an Account?',
//                         textColor: AppColors.secondaryGreyColor,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           context.push(SignupView());
//                         },
//                         child: CustomText(
//                           text: 'Sign Up',
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
