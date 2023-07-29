import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/cart_model.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class CartController extends BaseController {
  RxList<CartModel> cartList = <CartModel>[].obs;

  @override
  void onInit() {
    cartList.value = storage.getCartList();
    super.onInit();
  }

  void removeFromCartList(CartModel model) {
    cartList.remove(model);
    storage.setCartList(cartList);
  }

  void changeCount(bool incress, CartModel model) {
    CartModel? result = cartList.firstWhere(
        (element) => element.mealModel!.id == model.mealModel!.id, orElse: () {
      return CartModel();
    });

    int index = cartList.indexOf(result);

    if (incress) {
      result.count = result.count! + 1;
      result.total = result.total! + model.mealModel!.price!.toDouble();
    } else {
      if (result.count! > 1) {
        result.count = result.count! - 1;
        result.total = result.total! - model.mealModel!.price!.toDouble();
      }
    }

    cartList.remove(result);
    cartList.insert(index, result);

    storage.setCartList(cartList);
  }

//!---- First -----

  // RxDouble subTotal = 0.0.obs;
  // RxDouble tax = 0.0.obs;
  // RxDouble deliverFees = 0.0.obs;
  // RxDouble total = 0.0.obs;

  // void calcCartTotal() {
  //   subTotal.value = 0.0;
  //   cartList.forEach((element) {
  //     subTotal.value += element.total ?? 0.0;
  //     // subTotal.value =subTotal.value+ element.total ?? 0.0;
  //   });
  //   tax.value += subTotal.value * taxAmount;
  //   deliverFees.value += (subTotal.value + tax.value) * deliveryFeesAmount;
  //   total.value = subTotal.value + deliverFees.value + tax.value;
  // }

  //!--- Seconde -----
  double calcSubTotal() {
    double total = 0.0;
    cartList.forEach((element) {
      total += element.total ?? 0.0;
    });

    return total;
  }

  double calcTax() {
    double tax = 0.0;
    tax += calcSubTotal() * taxAmount;
    // return calcSubTotal() * taxAmount;
    return tax;
  }

  double calcDeliveryFees() {
    return (calcSubTotal() + calcTax()) * deliveryFeesAmount;
  }

  double calcTotal() {
    return calcSubTotal() + calcTax() + calcDeliveryFees();
  }

  //!--- Third ----
//   Map<String, double> calcTotals() {
//     double subTotal = 0.0;
//     double tax = 0.0;
//     double deliverFees = 0.0;
//     double total = 0.0;

//     cartList.forEach((element) {
//       subTotal += element.total ?? 0.0;
//     });
//     tax += subTotal * taxAmount;
//     deliverFees += (subTotal + tax) * deliveryFeesAmount;
//     total = subTotal + deliverFees + tax;

//     return {
//       "subTotal": subTotal,
//       "tax": tax,
//       "deliverFees": deliverFees,
//       "total": total
//     };
//   }
}
