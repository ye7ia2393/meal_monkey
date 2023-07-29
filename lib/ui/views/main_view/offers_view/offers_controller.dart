import 'package:flutter/widgets.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:get/get.dart';

class OffersController extends BaseController {
  TextEditingController offersController = TextEditingController(text: '0.0');
  RxDouble totall = 0.0.obs;

  void clcTax() {
    RxDouble? taxx = double.parse(offersController.text).obs;

    totall.value = taxx.value * 1000.0;
  }
}
