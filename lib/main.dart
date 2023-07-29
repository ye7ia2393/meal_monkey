import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_monkey/app/my_app.dart';
import 'package:meal_monkey/app/my_app_controller.dart';
import 'package:meal_monkey/core/data/repositories/shared_preferences_repository.dart';
import 'package:meal_monkey/core/services/cart_service.dart';
import 'package:meal_monkey/core/services/connectivity_service.dart';
import 'package:meal_monkey/core/services/location_service.dart';
import 'package:meal_monkey/core/services/notification_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.put(SharedPreferencesRepository());
  Get.put(CartService(

      // cartList: storage.getCartList(),
      ));
  runApp(const MyApp());
  Get.put(SharedPreferencesRepository());
  Get.put(CartService());
  //ram
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  Get.put(LocationService());
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }
}
