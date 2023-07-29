import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/ui/shared/colors.dart';
import 'package:meal_monkey/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CustomToast {
  static showMessage({
    required String message,
    MessageType? messageType = MessageType.INFO,
    void Function()? onClose,
  }) {
    String imageName = 'toast_info';
    Color shadowColor = AppColors.mainBlueColor;

    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'toast_rejected';
        shadowColor = AppColors.mainRedColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'toast_approved';
        shadowColor = AppColors.mainGreenColor;
        break;
      case MessageType.WARNING:
        imageName = 'toast_warning';
        shadowColor = AppColors.mainOrangeColor;
        break;
      case MessageType.INFO:
        imageName = 'toast_info';
        shadowColor = AppColors.mainBlueColor;
        break;
      default:
        break;
    }

    BotToast.showCustomText(
      onClose: () {
        onClose;
      },
      duration: Duration(seconds: 4),
      toastBuilder: (value) {
        return Container(
          margin: EdgeInsets.all(screenWidth(10)),
          width: screenWidth(1.25),
          // height: size.width * 0.4,
          decoration: BoxDecoration(
            color: AppColors.mainWhiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              (screenHeight(80)).ph,
              SvgPicture.asset(
                'assets/images/$imageName.svg',
                height: screenWidth(4),
                width: screenWidth(4),
              ),
              (screenHeight(80)).ph,
              Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: screenWidth(20)),
              ),
              (screenHeight(80)).ph,
            ],
          ),
        );
      },
    );
  }
}
