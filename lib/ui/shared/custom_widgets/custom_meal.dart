import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CustomMeal extends StatelessWidget {
  const CustomMeal({
    super.key,
    required this.imageUrl,
    required this.text,
    this.textColor,
  });
  final String imageUrl;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: screenHeight(3),
          width: screenWidth(1),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imageUrl,
            // imageUrl: mealList[index].images!.length > 0
            //     ? getFullImageUrl(mealList[index].images![0])
            //     : '',
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        (screenWidth(30)).ph,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(22),
          ),
          child: CustomText(
            text: text,
            // text: mealList[index].name ?? '',
            textColor: textColor ?? AppColors.mainGreyColor,
            fontSize: screenWidth(20),
            fontWeight: FontWeight.bold,
          ),
        ),
        (screenWidth(30)).ph,
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth(22),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/ic_star.svg',
                color: AppColors.mainOrangeColor,
                width: screenWidth(18),
                height: screenWidth(18),
              ),
              CustomText(
                text: ' 4.9 ',
                textColor: AppColors.mainOrangeColor,
                // fontSize: ,
              ),
              CustomText(
                text: '(124 ratings) Café',
                textColor: AppColors.placeholderGreyColor,
                // fontSize: ,
              ),
              CustomText(
                text: ' . ',
                textColor: AppColors.mainOrangeColor,
                // fontSize: ,
              ),
              CustomText(
                text: 'Western Food',
                textColor: AppColors.placeholderGreyColor,
                // fontSize: ,
              )
            ],
          ),
        )
      ],
    );
  }
}
