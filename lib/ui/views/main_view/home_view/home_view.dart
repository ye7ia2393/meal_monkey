import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_category.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_category02.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_category03.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_meal.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/cart_view/cart_view.dart';
import 'package:meal_monkey/ui/views/main_view/home_view/home_controller.dart';
import 'package:meal_monkey/ui/views/meal_details_view/meal_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.onMenuTap});
  final Function() onMenuTap;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          top: screenWidth(25),
          bottom: screenWidth(3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: '${tr('key_home_view_greeting')} Akila!',
                    textColor: AppColors.mainGreyColor,
                    fontSize: screenWidth(15),
                  ),
                  Obx(() {
                    return Icon(
                      controller.isOnlne.value ? Icons.wifi : Icons.wifi_off,
                      color:
                          controller.isOnlne.value ? Colors.green : Colors.red,
                      size: screenWidth(10),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      Get.to(() => CartView());
                    },
                    child: SvgPicture.asset(
                      'assets/images/ic_shopping_cart.svg',
                      color: AppColors.mainOrangeColor,
                      width: screenWidth(12),
                      height: screenWidth(12),
                    ),
                  ),
                ],
              ),
            ),
            (screenWidth(20)).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(22),
              ),
              child: CustomText(
                text: tr('key_home_view_delivering_to'),
                textColor: AppColors.placeholderGreyColor,
                fontSize: screenWidth(30),
              ),
            ),
            (screenWidth(30)).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(22),
              ),
              child: CustomText(
                text: tr('key_home_view_current_location'),
                textColor: AppColors.placeholderGreyColor,
                fontSize: screenWidth(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            (screenWidth(15)).ph,
            Center(
              child: CustomTextFormField(
                hintText: tr('key_home_view_search'),
                controller: controller.searchController,
                fillColor: AppColors.fillGreyColor,
                hintTextColor: AppColors.placeholderGreyColor,
                prefixIcon: Icon(Icons.search),
                prefixIconColor: AppColors.secondaryGreyColor,
              ),
            ),
            (screenWidth(15)).ph,
            SizedBox(
              height: screenHeight(4),
              // height: screenWidth(2),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(22),
                ),
                child: Obx(
                  () {
                    return controller.isCategoryLoading
                        ? SpinKitCircle(
                            color: AppColors.mainOrangeColor,
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCategory(
                                imageUrl: controller.categoryList[index].logo ??
                                    "https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png",
                                text: controller.categoryList[index].name ?? '',
                              );
                            },
                          );
                  },
                ),
              ),
            ),
            (screenWidth(10)).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: tr('key_home_view_popular_restaurents'),
                    textColor: AppColors.mainGreyColor,
                    fontSize: screenWidth(15),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: tr('key_home_view_view_all'),
                      textColor: AppColors.mainOrangeColor,
                      fontSize: screenWidth(25),
                    ),
                  ),
                ],
              ),
            ),
            (screenWidth(20)).ph,
            Obx(
              () {
                return controller.isMealLoading
                    ? SpinKitCircle(
                        color: AppColors.mainOrangeColor,
                      )
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: controller.mealList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => MealDetailsView(
                                  selecetedMeal: controller.mealList[index],
                                ),
                              );
                            },
                            child: CustomMeal(
                              imageUrl:
                                  controller.mealList[index].images!.length > 0
                                      ? getFullImageUrl(
                                          controller.mealList[index].images![0])
                                      : '',
                              text: controller.mealList[index].name ?? '',
                            ),
                          );
                        },
                      );
              },
            ),
            (screenWidth(10)).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: tr('key_home_view_most_popular'),
                    textColor: AppColors.mainGreyColor,
                    fontSize: screenWidth(15),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: tr('key_home_view_view_all'),
                      textColor: AppColors.mainOrangeColor,
                      fontSize: screenWidth(25),
                    ),
                  ),
                ],
              ),
            ),
            (screenWidth(20)).ph,
            SizedBox(
              height: screenHeight(2),
              // height:  screenWidth(2),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(22),
                ),
                child: Obx(
                  () {
                    return controller.isCategoryLoading
                        ? SpinKitCircle(
                            color: AppColors.mainOrangeColor,
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCategory02(
                                imageUrl:
                                    "https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png",
                                text: controller.categoryList[index].name ?? '',
                              );
                            },
                          );
                  },
                ),
              ),
            ),
            (screenWidth(10)).ph,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth(22),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: tr('key_home_view_recent_items'),
                    textColor: AppColors.mainGreyColor,
                    fontSize: screenWidth(15),
                  ),
                  InkWell(
                    onTap: () {},
                    child: CustomText(
                      text: tr('key_home_view_view_all'),
                      textColor: AppColors.mainOrangeColor,
                      fontSize: screenWidth(25),
                    ),
                  ),
                ],
              ),
            ),
            // ( screenWidth(20)).ph,
            (screenWidth(20)).ph,
            SizedBox(
              height: screenHeight(2),
              // height:  screenWidth(2),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth(22),
                ),
                child: Obx(
                  () {
                    return controller.isCategoryLoading
                        ? SpinKitCircle(
                            color: AppColors.mainOrangeColor,
                          )
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.categoryList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomCategory03(
                                imageUrl:
                                    "https://training.owner-tech.com/Images/91b43499-de8b-4d6d-9af8-3f18872bdc5c.png",
                                text: controller.categoryList[index].name ?? '',
                              );
                            },
                          );
                  },
                ),
                //
              ),
            ),
          ],
        ),
      ),
    );
  }
}
