import 'package:meal_monkey/core/enums/connectivitystatus.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class MyAppController extends BaseController {
  ConnectivityStatus connectivityStatus = ConnectivityStatus.ONLINE;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus = value;
  }

  void listenForConnectivityStatus() {
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
    });
  }

  @override
  void onInit() {
    listenForConnectivityStatus();
    super.onInit();
  }
}
