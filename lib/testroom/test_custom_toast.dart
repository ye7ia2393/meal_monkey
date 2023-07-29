// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/ui/shared/colors.dart';

// class TestCustomToast {
//   static showMessage({
//     required String message,
//     MessageType? messageType = MessageType.INFO,
//     void Function()? onClose,
//   }) {
//     String imageName = 'toast_info';
//     Color shadowColor = AppColors.mainBlueColor;

//     switch (messageType) {
//       case MessageType.REJECTED:
//         imageName = 'toast_rejected';
//         shadowColor = AppColors.mainRedColor;
//         break;
//       case MessageType.SUCCESS:
//         imageName = 'toast_approved';
//         shadowColor = AppColors.mainGreenColor;
//         break;
//       case MessageType.WARNING:
//         imageName = 'toast_warning';
//         shadowColor = AppColors.mainOrangeColor;
//         break;
//       case MessageType.INFO:
//         imageName = 'toast_info';
//         shadowColor = AppColors.mainBlueColor;
//         break;
//       default:
//         break;
//     }

//     BotToast.showCustomText(
//       onClose: () {
//         onClose;
//       },
//       duration: Duration(seconds: 4),
//       toastBuilder: (value) {
//         return Container(
//           margin: EdgeInsets.all(35),
//           width: 200,
//           // height: size.width * 0.4,
//           decoration: BoxDecoration(
//             color: AppColors.mainWhiteColor,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: [
//               BoxShadow(
//                 color: shadowColor.withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               // (size.height * 0.01).ph,
//               SvgPicture.asset(
//                 'assets/images/$imageName.svg',
//                 height: 50,
//                 width: 50,
//               ),
//               // (size.height * 0.01).ph,
//               Text(
//                 message,
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 18),
//               ),
//               // (size.height * 0.01).ph,
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
