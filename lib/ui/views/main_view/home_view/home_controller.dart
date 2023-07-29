import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/core/data/models/apis/category_model.dart';
import 'package:meal_monkey/core/data/models/apis/meal_model.dart';
import 'package:meal_monkey/core/data/repositories/category_repository.dart';
import 'package:meal_monkey/core/data/repositories/meal_repository.dart';
import 'package:meal_monkey/core/enums/connectivitystatus.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/enums/operation_type.dart';
import 'package:meal_monkey/core/enums/request_status.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class HomeController extends BaseController {
  TextEditingController searchController = TextEditingController();

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  RxList<MealModel> mealList = <MealModel>[].obs;

  bool get isCategoryLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.CATEGORY);
  // operationType == OperationType.CATEGORY;

  bool get isMealLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.MEAL);
  // operationType == OperationType.MEAL;
  RxBool isOnlne = true.obs;

  @override
  void onInit() {
    getAllCategory();
    getAllMeal();
    super.onInit();
  }

  @override
  void onReady() {
    checkConnection();
    super.onReady();
  }

  void checkConnection() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      isOnlne.value = event == ConnectivityStatus.ONLINE;
    });
  }

  void getAllCategory() {
    runFullLoadingFunction(
      type: OperationType.CATEGORY,
      function: CategoryRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              // categoryList.clear();
              categoryList.addAll(r);
            },
          );
        },
      ),
    );
  }

  void getAllMeal() {
    runFullLoadingFunction(
      type: OperationType.MEAL,
      function: MealRepository().getAll().then(
        (value) {
          value.fold(
            (l) {
              CustomToast.showMessage(
                message: l,
                messageType: MessageType.REJECTED,
              );
            },
            (r) {
              // mealList.clear();
              mealList.addAll(r);
            },
          );
        },
      ),
    );
  }
}
