import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/data/models/cart_model.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/cart_view/cart_view.dart';
import 'package:meal_monkey/ui/views/main_view/main_controller.dart';

class MealDetailsController extends MainController {
  MealDetailsController({required MealModel mealModel}) {
    model = mealModel;
  }
  MealModel model = MealModel();
  RxInt count = 1.obs;
  RxDouble rating = 0.0.obs;

  void changeCount(bool increase) {
    if (increase)
      count++;
    else {
      if (count > 1) {
        count--;
      }
    }
  }

  double calcTotal() {
    return (count.value * model.price!).toDouble();
  }

  void addToCart() {
    List<CartModel> list = storage.getCartList();

    CartModel? result = list.firstWhere(
      (element) => element.mealModel!.id == model.id,
      orElse: () {
        return CartModel();
      },
    );

    if (result.count != null) {
      int index = list.indexOf(result);
      list[index].count = list[index].count! + count.value;
      list[index].total = list[index].total! + calcTotal();
    } else {
      list.add(
        CartModel(
          count: count.value,
          total: calcTotal(),
          mealModel: model,
        ),
      );
    }

    storage.setCartList(list);
    Get.to(CartView());
  }

  // int mealTotalPrice(int price) {
  //   return price * count.value;
  // }

  // int mealCountChange() {
  //   return count.value;
  // }
}
