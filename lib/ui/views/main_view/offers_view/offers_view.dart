import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_text_field.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/main_view/offers_view/offers_controller.dart';

class OffersView extends StatefulWidget {
  const OffersView({super.key});

  @override
  State<OffersView> createState() => _OffersViewState();
}

class _OffersViewState extends State<OffersView> {
  OffersController controller = Get.put(OffersController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(
        () {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Offers View",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              CustomTextFormField(
                hintText: "tax",
                controller: controller.offersController,
                fillColor: AppColors.mainGreenColor,
                hintTextColor: AppColors.dropShadowColor,
              ),
              SizedBox(height: screenHeight(10)),
              controller.offersController.text.isEmpty
                  ? CustomText(
                      text: 'totall : nothing',
                    )
                  : InkWell(
                      onTap: () {
                        controller.clcTax();
                      },
                      child: CustomText(
                        text: 'totall : ${controller.totall.value}',
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
