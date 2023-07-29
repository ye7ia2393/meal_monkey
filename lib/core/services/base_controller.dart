// import 'package:bot_toast/bot_toast.dart';
// import 'package:get/get.dart';
// import 'package:meal_monkey/core/enums/operation_type.dart';
// import 'package:meal_monkey/core/enums/request_status.dart';
// import 'package:meal_monkey/ui/shared/utils.dart';

// class BaseController extends GetxController {
//   var requestStatus = RequestStatus.DEFAULT.obs;
//   var operationType = OperationType.NONE.obs;
//   RxList<OperationType> operationTypeList = <OperationType>[].obs;

//   bool get isLoading =>
//       requestStatus == RequestStatus.LOADING &&
//       operationTypeList.contains(OperationType.NONE);

//   set setRequestStatus(RequestStatus value) {
//     requestStatus.value = value;
//   }

//   set setOperationType(OperationType value) {
//     operationType.value = value;
//   }

//   Future runFutureFunction({
//     required Future function,
//   }) async {
//     await function;
//   }

//   Future runFutureFunctionWithLoading({
//     required Future function,
//     OperationType? operationType = OperationType.NONE,
//   }) async {
//     setRequestStatus = RequestStatus.LOADING;
//     operationTypeList.add(operationType!);
//     // setOperationType = operationType!;
//     await function;
//     setRequestStatus = RequestStatus.DEFAULT;
//     operationTypeList.remove(operationType);
//     // setOperationType = OperationType.NONE;
//   }

//   Future runFutureFunctionWithFullLoading({
//     required Future function,
//     OperationType? operationType = OperationType.NONE,
//   }) async {
//     customLoader();
//     await function;
//     BotToast.closeAllLoading();
//   }
// }

import 'package:bot_toast/bot_toast.dart';

import 'package:get/get.dart';
import 'package:meal_monkey/core/enums/message_type.dart';
import 'package:meal_monkey/core/enums/operation_type.dart';
import 'package:meal_monkey/core/enums/request_status.dart';
import 'package:meal_monkey/ui/shared/custom_widgets/custom_toast.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class BaseController extends GetxController {
  var requestStatus = RequestStatus.DEFAULT.obs;
  var opertionType = OperationType.NONE.obs;
  RxList<OperationType> operationTypeList = <OperationType>[].obs;
  bool get isLoading =>
      requestStatus == RequestStatus.LOADING &&
      operationTypeList.contains(OperationType.NONE);
  set setRequestStatus(RequestStatus value) {
    requestStatus.value = value;
  }

  set setOpertionType(OperationType value) {
    opertionType.value = value;
  }

  Future runFutuerFunction({required Future function}) async {
    checkConnection(() async {
      await function;
    });
  }

  Future runLoadingFutureFunction(
      {required Future function,
      OperationType? type = OperationType.NONE}) async {
    if (isOnline) {
      requestStatus.value = RequestStatus.LOADING;
      operationTypeList.add(type!);
      await function;
      requestStatus.value = RequestStatus.DEFAULT;
      operationTypeList.remove(type);
    } else {
      CustomToast.showMessage(
          message: 'Please check internet connection',
          messageType: MessageType.WARNING);
    }
  }

  Future runFullLoadingFunction({
    required Future function,
    OperationType? type,
  }) async {
    // checkConnection(() async {
    //   customLoader();
    //   await function;
    //   BotToast.closeAllLoading();
    // });
    if (isOnline) {
      customLoader();
      await function;
      BotToast.closeAllLoading();
    } else {
      CustomToast.showMessage(
          message: 'Please check internet connection',
          messageType: MessageType.WARNING);
    }
  }
}
