// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:meal_monkey/ui/shared/colors.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_navigator_shared.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
// import 'package:meal_monkey/ui/shared/utils.dart';
// import 'package:meal_monkey/ui/views/login_view/login_view.dart';

// class TestSignupView extends StatefulWidget {
//   const TestSignupView({super.key});

//   @override
//   State<TestSignupView> createState() => _TestSignupViewState();
// }

// class _TestSignupViewState extends State<TestSignupView> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final ImagePicker picker = ImagePicker();
//   XFile? choosedImage;
//   bool showOptions = false;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         // resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: size.width / 30,
//               vertical: size.width / 30,
//             ),
//             child: ListView(
//               shrinkWrap: true,
//               children: [
//                 CustomText(
//                   text: 'Sign Up',
//                   textColor: AppColors.mainGreyColor,
//                   fontSize: size.width * 0.1,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomText(
//                   text: 'Add your details to sign up',
//                   textColor: AppColors.secondaryGreyColor,
//                 ),
//                 (size.height * 0.02).ph,
//                 Stack(
//                   children: [
//                     InkWell(
//                       onTap: choosedImage == null
//                           ? () {
//                               showBottomSheet();
//                               // showDialog(
//                               //   context: context,
//                               //   builder: (context) {
//                               //     return AlertDialog(
//                               //       title: Text("Choose Image"),
//                               //       content: Text(
//                               //           "Would you like to choose image form Camera or Gallery"),
//                               //       actions: [
//                               //         TextButton(
//                               //           child: Text("Camera"),
//                               //           onPressed: () async {
//                               //             choosedImage = await picker.pickImage(
//                               //                 source: ImageSource.camera);
//                               //             setState(() {});
//                               //           },
//                               //         ),
//                               //         TextButton(
//                               //           child: Text("Gallery"),
//                               //           onPressed: () async {
//                               //             choosedImage = await picker.pickImage(
//                               //                 source: ImageSource.gallery);
//                               //             setState(() {});
//                               //           },
//                               //         ),
//                               //       ],
//                               //     );
//                               //   },
//                               // );
//                             }
//                           : null,
//                       child: Center(
//                         child: CircleAvatar(
//                           backgroundColor: AppColors.mainOrangeColor,
//                           radius: size.width / 4,
//                           backgroundImage: choosedImage == null
//                               ? Image.asset(
//                                   "assets/images/cat.jpg",
//                                   fit: BoxFit.fill,
//                                 ).image
//                               : Image.file(
//                                   File(choosedImage?.path ?? ""),
//                                   fit: BoxFit.cover,
//                                 ).image,
//                           // Image.file(
//                           // File(choosedImage?.path ?? ""),
//                         ),
//                       ),
//                     ),
//                     Visibility(
//                       visible: choosedImage != null,
//                       child: Positioned(
//                         bottom: 0,
//                         right: size.width / 5,
//                         child: InkWell(
//                           onTap: () {
//                             showBottomSheet();
//                           },
//                           child: CircleAvatar(
//                             backgroundColor: AppColors.mainOrangeColor,
//                             child: Icon(
//                               Icons.edit,
//                               color: AppColors.mainWhiteColor,
//                             ),
//                             radius: size.width / 15,
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Name',
//                   controller: nameController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildName(value)) {
//                       return 'Enter a valid Name';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.name,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Email',
//                   controller: emailController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildEmail(value)) {
//                       return 'Please Enter a valid Email';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.emailAddress,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Mobile No',
//                   controller: mobileNoController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildMobileNo(value)) {
//                       return 'Please Enter a valid Mobile Number';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.phone,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Address',
//                   controller: addressController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildName(value)) {
//                       return 'Please Enter a vaild Address';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.text,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Password',
//                   controller: passwordController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildPassword(value)) {
//                       return 'Please Enter a valid password';
//                     }
//                     return null;
//                   },
//                   fillColor: AppColors.fillGreyColor,
//                   hintTextColor: AppColors.placeholderGreyColor,
//                   keyboardType: TextInputType.visiblePassword,
//                   obscureText: true,
//                 ),
//                 (size.height * 0.02).ph,
//                 CustomTextFormField(
//                   hintText: 'Confirm Password',
//                   controller: confirmPasswordController,
//                   validator: (value) {
//                     if (value!.isEmpty || !isVaildPassword(value)) {
//                       return 'Please Enter a valid password ';
//                     } else if (passwordController.text !=
//                         confirmPasswordController.text) {
//                       return 'make sure your password match';
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
//                   text: 'Sign Up',
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       // context.pushReplacement(LoginView());
//                     }
//                   },
//                 ),
//                 (size.height * 0.02).ph,
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomText(
//                         text: 'Already have an Account? ',
//                         textColor: AppColors.secondaryGreyColor,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           context.pushReplacement(LoginView());
//                         },
//                         child: CustomText(
//                           text: 'Login',
//                           textColor: AppColors.mainOrangeColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void showBottomSheet() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("Choose Image"),
//           content:
//               Text("Would you like to choose image form Camera or Gallery"),
//           actions: [
//             TextButton(
//               child: Text("Camera"),
//               onPressed: () async {
//                 choosedImage =
//                     await picker.pickImage(source: ImageSource.camera);
//                 setState(() {});
//               },
//             ),
//             TextButton(
//               child: Text("Gallery"),
//               onPressed: () async {
//                 choosedImage =
//                     await picker.pickImage(source: ImageSource.gallery);
//                 setState(() {});
//               },
//             ),
//           ],
//         );
//       },
//     );
//     // showModalBottomSheet(
//     //     shape: RoundedRectangleBorder(
//     //       borderRadius: BorderRadius.only(
//     //         topLeft: Radius.circular(20),
//     //         topRight: Radius.circular(20),
//     //       ),
//     //     ),
//     //     context: context,
//     //     builder: (context) => Column(
//     //       mainAxisSize: MainAxisSize.min,
//     //       children: [
//     //         ListTile(
//     //           leading: Icon(
//     //             Icons.camera_alt,
//     //             color: AppColors.mainOrangeColor,
//     //           ),
//     //           title: CustomText(
//     //             text: 'Camera',
//     //             textAlign: TextAlign.start,
//     //           ),
//     //           onTap: () async {
//     //             choosedImage =
//     //                 await picker.pickImage(source: ImageSource.camera);
//     //             setState(() {
//     //               showOptions = true;
//     //             });
//     //           },
//     //         ),
//     //         ListTile(
//     //           leading: Icon(
//     //             Icons.image,
//     //             color: AppColors.mainOrangeColor,
//     //           ),
//     //           title: CustomText(
//     //             text: 'Gallery',
//     //             textAlign: TextAlign.start,
//     //           ),
//     //           onTap: () async {
//     //             choosedImage =
//     //                 await picker.pickImage(source: ImageSource.gallery);
//     //             setState(
//     //               () {
//     //                 showOptions = true;
//     //               },
//     //             );
//     //           },
//     //         )
//     //       ],
//     //     ),
//     //   );
//   }
// }
