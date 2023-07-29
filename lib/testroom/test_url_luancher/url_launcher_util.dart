// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/testroom/test_url_luancher/url_type.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
// import 'package:url_launcher/url_launcher.dart';

// class UrlLauncherUtil {
//   static Future<void> startLaunchUrl({
//     required Uri url,
//     required UrlType type,
//   }) async {
//     switch (type) {
//       case UrlType.WEB:
//         await _launchWEB(url);
//         break;
//       case UrlType.EMAIL:
//         await _launchEMAIL(url);
//         break;
//       case UrlType.PHONE:
//         await _launchPHONE(url);
//         break;
//       case UrlType.SMS:
//         await _launchSMS(url);
//         break;
//     }
//   }

//   static Future<void> _launchWEB(Uri url) async {
//     if (!await launchUrl(url))
//       CustomToast.showMessage(
//         message: 'cant launch url',
//         messageType: MessageType.REJECTED,
//       );
//   }

//   static Future<void> _launchEMAIL(Uri EMAIL) async {
//     final Uri uri = Uri(
//       scheme: 'mailto',
//       path: EMAIL.toString(),
//     );
//     if (await canLaunch(uri.toString())) {
//       await launch(uri.toString());
//     } else {
//       CustomToast.showMessage(
//         message: 'cant launch url',
//         messageType: MessageType.REJECTED,
//       );
//     }
//   }

//   static Future<void> _launchPHONE(Uri PHONE) async {
//     final Uri uri = Uri(
//       scheme: 'tel',
//       path: PHONE.toString(),
//     );
//     if (await canLaunch(uri.toString())) {
//       await launch(uri.toString());
//     } else
//       CustomToast.showMessage(
//           message: 'cant launch url', messageType: MessageType.REJECTED);
//   }

//   static Future<void> _launchSMS(Uri PHONE) async {
//     final Uri uri = Uri(
//       scheme: 'SMS',
//       path: PHONE.toString(),
//     );
//     if (await canLaunch(uri.toString())) {
//       await launch(uri.toString());
//     } else
//       CustomToast.showMessage(
//           message: 'cant launch url', messageType: MessageType.REJECTED);
//   }
// }
