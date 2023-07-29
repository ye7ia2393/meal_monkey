import 'package:flutter/material.dart';

import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_button.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/checkout_view/checkout_controller.dart';
import 'package:meal_monkey/ui/views/main_view/main_view.dart';

class CheckoutView extends StatefulWidget {
  CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViweState();
}

class _CheckoutViweState extends State<CheckoutView> {
  CheckoutController controller = Get.put(CheckoutController());

  @override
  void initState() {
    storage.setOrderPlaced(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        //  WillPopScope(
        //     child:
        SafeArea(
            child: Scaffold(
      body: Column(
        children: [
          Text(
            'sub Total: ${cartService.subTotal.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Text(
            'Tax: ${cartService.tax.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Text(
            'Delivery: ${cartService.delivery.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          Text(
            'Total: ${cartService.total.value}',
            style: TextStyle(fontSize: screenWidth(10)),
          ),
          CustomButton(
            text: 'Continue shopping',
            onPressed: () {
              cartService.clearCart();
              Get.off(MainView());
            },
          )
        ],
      ),
    ));
    // onWillPop: () async {
    //   cartService.clearCart();
    //   Get.off(MainView());

    //   return false;
    // });
  }
}
