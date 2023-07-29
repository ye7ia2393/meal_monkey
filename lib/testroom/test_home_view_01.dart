// import 'package:flutter/material.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
// import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';

// class HomeView extends StatefulWidget {
//   const HomeView({super.key});

//   @override
//   State<HomeView> createState() => _HomeViewState();
// }

// class _HomeViewState extends State<HomeView> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Home View",
//           style: TextStyle(
//             fontSize: 25,
//           ),
//         ),
//         (size.width / 13).ph,
//         CustomButton(
//           myButtonText: 'Open Drawer',
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           },
//         ),
//       ],
//     );
//   }
// }
