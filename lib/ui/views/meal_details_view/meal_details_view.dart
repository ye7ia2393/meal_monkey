import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/cart_view/cart_view.dart';
import 'package:meal_monkey/ui/views/meal_details_view/meal_details_controller.dart';

class MealDetailsView extends StatefulWidget {
  MealDetailsView({
    super.key,
    required this.selecetedMeal,
  });

  final MealModel selecetedMeal;

  @override
  State<MealDetailsView> createState() => _MealDetailsViewState();
}

class _MealDetailsViewState extends State<MealDetailsView> {
  late MealDetailsController controller;
  @override
  void initState() {
    controller = MealDetailsController(mealModel: widget.selecetedMeal);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: screenWidth(1),
        height: screenHeight(1),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          // clipBehavior: Clip.antiAlias,
          children: [
            Container(
              width: screenWidth(1),
              child: CachedNetworkImage(
                height: screenHeight(2),
                fit: BoxFit.cover,
                imageUrl: widget.selecetedMeal.images![0],
                // imageUrl: mealList[index].images!.length > 0
                //     ? getFullImageUrl(mealList[index].images![0])
                //     : '',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30),
                    topEnd: Radius.circular(30),
                  ),
                  shape: BoxShape.rectangle,
                  color: AppColors.mainWhiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.dropShadowColor,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(
                        vertical: screenWidth(20),
                        horizontal: screenWidth(25),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomText(
                                // text:
                                // "no name foundno name foundno name foundno name found",
                                text: controller.model.name ?? "no name found",
                                textColor: AppColors.mainGreyColor,
                                fontSize: screenWidth(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RatingBar(
                                        initialRating: controller.rating.value,
                                        direction: Axis.horizontal,
                                        itemCount: 5,
                                        itemSize: screenWidth(22),
                                        ratingWidget: RatingWidget(
                                          full: SvgPicture.asset(
                                            'assets/images/ic_star_full.svg',
                                            color: AppColors.mainOrangeColor,
                                          ),
                                          half: SvgPicture.asset(
                                            'assets/images/ic_star_full.svg',
                                            color: AppColors.mainOrangeColor,
                                          ),
                                          empty: SvgPicture.asset(
                                            'assets/images/ic_star_empty.svg',
                                            color: AppColors.mainOrangeColor,
                                          ),
                                        ),
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        onRatingUpdate: (rating) {
                                          controller.rating.value = rating;
                                          print(controller.rating.value);
                                        },
                                      ),
                                      CustomText(
                                        text:
                                            '${controller.rating.value.toStringAsFixed(0)} ${tr('key_rating')}',
                                        fontSize: screenWidth(27.5),
                                        textColor: AppColors.mainOrangeColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  CustomText(
                                    text:
                                        '${tr('key_price_currency')}. ${controller.model.price}',
                                    textColor: AppColors.mainGreyColor,
                                    fontSize: screenWidth(10),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: '/ ${tr('key_price_per_portion')}',
                                    textColor: AppColors.mainGreyColor,
                                    fontSize: screenWidth(27.5),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CustomText(
                            text: tr('key_description'),
                            textColor: AppColors.mainGreyColor,
                            fontWeight: FontWeight.bold,
                          ),
                          CustomText(
                            text: controller.model.description ??
                                "no description found",
                            fontSize: screenWidth(27.5),
                            textColor: AppColors.secondaryGreyColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: tr('Number of Portions'),
                                textColor: AppColors.mainGreyColor,
                                fontWeight: FontWeight.bold,
                              ),
                              Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomButton(
                                      text: '-',
                                      height: screenHeight(20),
                                      width: screenWidth(6),
                                      backgroundColor:
                                          controller.count.value == 1
                                              ? AppColors.placeholderGreyColor
                                              : AppColors.mainOrangeColor,
                                      onPressed: controller.count.value == 1
                                          ? null
                                          : () {
                                              controller.changeCount(false);
                                            },
                                    ),
                                    (screenWidth(50)).pw,
                                    CustomButton(
                                      text: "${controller.count.value}",
                                      textColor: AppColors.mainOrangeColor,
                                      height: screenHeight(20),
                                      width: screenWidth(6),
                                      backgroundColor: AppColors.mainWhiteColor,
                                      borderColor: AppColors.mainOrangeColor,
                                      onPressed: () {},
                                    ),
                                    (screenWidth(50)).pw,
                                    CustomButton(
                                      text: '+',
                                      height: screenHeight(20),
                                      width: screenWidth(6),
                                      onPressed: () {
                                        controller.changeCount(true);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.centerStart,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(40),
                                  bottomEnd: Radius.circular(40),
                                ),
                                color: AppColors.mainOrangeColor,
                              ),
                              width: screenWidth(4),
                              height: screenWidth(2),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: screenWidth(6),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadiusDirectional.only(
                                    topStart: Radius.circular(40),
                                    topEnd: Radius.circular(10),
                                    bottomStart: Radius.circular(40),
                                    bottomEnd: Radius.circular(10),
                                  ),
                                  color: AppColors.mainWhiteColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.dropShadowColor,
                                      blurRadius: 12,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                width: screenWidth(1.5),
                                height: screenWidth(3),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: screenWidth(30),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomText(
                                        text: '${tr('key_price_total')}',
                                        textColor: AppColors.mainGreyColor,
                                        fontSize: screenWidth(30),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      Obx(
                                        () => CustomText(
                                          text:
                                              '${tr('key_price_currency')} ${controller.calcTotal()}',
                                          textColor: AppColors.mainGreyColor,
                                          fontSize: screenWidth(15),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      CustomButton(
                                        text: tr('key_cart_add'),
                                        fontSize: screenWidth(32),
                                        fontWeight: FontWeight.w600,
                                        imageName: 'ic_shopping_cart',
                                        imageColor: AppColors.mainWhiteColor,
                                        imageWidth: screenWidth(25),
                                        height: screenHeight(20),
                                        width: screenWidth(2.5),
                                        onPressed: () {
                                          controller.addToCart();
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: screenWidth(1.3),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => CartView());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(screenWidth(30)),
                                  width: (screenWidth(8)),
                                  height: (screenWidth(8)),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainWhiteColor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.dropShadowColor,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/ic_shopping_cart.svg',
                                    // fit: BoxFit.cover,
                                    color: AppColors.mainOrangeColor,
                                    // width: screenWidth(30),
                                    // height: screenWidth(30),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                // controller.showBottomSheet();
              },
              child: Padding(
                padding: EdgeInsetsDirectional.only(
                  top: screenHeight(3),
                  start: screenWidth(1.5),
                  // end: screenWidth(15),
                ),
                child: Container(
                  padding: EdgeInsets.all(screenWidth(20)),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: SvgPicture.asset(
                    'assets/images/ic_heart.svg',
                    // fit: BoxFit.cover,
                    color: AppColors.mainOrangeColor,
                    // width: screenWidth(30),
                    // height: screenWidth(30),
                  ),
                  width: (screenWidth(6)),
                  height: (screenWidth(6)),
                  decoration: BoxDecoration(
                    color: AppColors.mainWhiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.dropShadowColor,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
