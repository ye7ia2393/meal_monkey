// import 'package:flutter/material.dart';
// import 'package:meal_monkey/data/repositories/shared_preferences_repository.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
// import 'package:meal_monkey/ui/views/splash_screen/splash_screen_view.dart';

// class TestHomeView extends StatelessWidget {
//   const TestHomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(actions: [
//         IconButton(
//             onPressed: () {
//               SharedPreferencesRepository.clearToken();
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return SplashScreenView();
//                   },
//                 ),
//               );
//             },
//             icon: Icon(Icons.logout)),
//       ]),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: size.width * 0.04,
//         ),
//         child: ListView(
//           shrinkWrap: true,
//           children: [
//             const Text('My Home Page'),
//             (size.height * 0.02).ph,
//           ],
//         ),
//       ),
//     );
//   }
// }
