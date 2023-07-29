// import 'package:flutter/material.dart';
// import 'package:meal_monkey/core/data/models/apis/category_model.dart';
// import 'package:meal_monkey/core/data/repositories/category_repository.dart';
// import 'package:meal_monkey/core/enums/message_type.dart';
// import 'package:meal_monkey/ui/shared/colors.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
// import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';

// class HomeViewErrorToSolve extends StatefulWidget {
//   final Function() onMenuTap;
//   HomeViewErrorToSolve({Key? key, required this.onMenuTap}) : super(key: key);

//   @override
//   State<HomeViewErrorToSolve> createState() => _HomeViewErrorToSolveState();
// }

// class _HomeViewErrorToSolveState extends State<HomeViewErrorToSolve> {
//   List<CategoryModel> categoryList = [];
//   // bool textColor = false;
//   int? selectedIndex = -1;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     return ListView(
//       children: [
//         Visibility(
//           visible: categoryList.length == 0,
//           child: CustomButton(
//             text: 'Get Categories',
//             onPressed: () {
//               CategoryRepository().getAll().then((value) {
//                 value.fold((l) {
//                   CustomToast.showMessage(
//                       message: l, messageType: MessageType.REJECTED);
//                 }, (r) {
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   categoryList.addAll(r);
//                   setState(() {});
//                 });
//               });
//             },
//           ),
//         ),
//         Visibility(
//           visible: categoryList.length > 0,
//           child: ListView.separated(
//             physics: BouncingScrollPhysics(),
//             shrinkWrap: true,
//             itemCount: categoryList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Text(
//                 categoryList[index].name ?? '',
//                 style: TextStyle(
//                   fontSize: 60,
//                   color: selectedIndex == index
//                       ? AppColors.mainOrangeColor
//                       : AppColors.mainBlueColor,
//                 ),
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return Container(
//                 width: 100,
//                 height: 5,
//                 color: AppColors.mainOrangeColor,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
