// import 'package:flutter/material.dart';
// import 'package:meal_monkey/testroom/test_url_luancher/url_launcher_util.dart';
// import 'package:meal_monkey/testroom/test_url_luancher/url_type.dart';

// class Lun extends StatefulWidget {
//   const Lun({super.key});

//   @override
//   State<Lun> createState() => _LunState();
// }

// class _LunState extends State<Lun> {
//   // final Uri url = Uri.parse('https://www.google.com');
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             ElevatedButton(
//               // onPressed: () {
//               //   claunchUrl(url);
//               // },
//               onPressed: () async {
//                 await UrlLauncherUtil.launchUrl(
//                   Uri.parse('https://www.google.com'),
//                   UrlType.WEB,
//                 );
//               },
//               child: Text('Op'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // Future<void> launchUrl(
// //   String url, {
// //   String? scheme,
// // }) async {
// //   if (scheme != null) {
// //     url = '$scheme://$url';
// //   }
// //   // ignore: deprecated_member_use
// //   if (await canLaunch(url)) {
// //     // ignore: deprecated_member_use
// //     await launch(url);
// //   } else {
// //     CustomToast.showMessage(
// //         message: 'cant launch url', messageType: MessageType.REJECTED);
// //   }
// // }
