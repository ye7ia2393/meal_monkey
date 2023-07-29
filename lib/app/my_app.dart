// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:meal_monkey/core/translation/app_translation.dart';
// import 'package:meal_monkey/ui/shared/utils.dart';
// import 'package:meal_monkey/ui/views/splash_screen_view/splash_screen_view.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     globalContext = context;
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Meal Monkey',
//       locale: getLocale(),
//       fallbackLocale: getLocale(),
//       translations: AppTranslation(),
//       defaultTransition: Transition.downToUp,
//       transitionDuration: Duration(milliseconds: 50),
//       builder: BotToastInit(),
//       navigatorObservers: [BotToastNavigatorObserver()],
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreenView(),
//     );
//   }
// }

// BuildContext? globalContext;

// Locale getLocale() {
//   if (storage.getAppLanguage() == 'ar') {
//     return Locale('ar', 'SA');
//   } else if (storage.getAppLanguage() == 'tr') {
//     return Locale('tr', 'TR');
//   } else {
//     return Locale('en', 'US');
//   }
// }
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:meal_monkey/core/enums/connectivitystatus.dart';
import 'package:meal_monkey/core/translation/app_translation.dart';
import 'package:meal_monkey/ui/shared/utils.dart';
import 'package:meal_monkey/ui/views/splash_screen_view/splash_screen_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.ONLINE,
        create: (context) =>
            connectivityService.connectivityStatusController.stream,
        child: GetMaterialApp(
            defaultTransition: Transition.circularReveal,
            transitionDuration: Duration(milliseconds: 12),
            title: 'Flutter Demo',
            builder: BotToastInit(),
            locale: getLocale(),
            fallbackLocale: getLocale(),
            translations: AppTranslation(), //1. call BotToastInit
            navigatorObservers: [BotToastNavigatorObserver()],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SplashScreenView()));
  }
}

Locale getLocale() {
  if (storage.getAppLanguage() == 'ar') {
    return Locale('ar', 'SA');
  } else if (storage.getAppLanguage() == 'tr') {
    return Locale('tr', 'TR');
  } else {
    return Locale('en', 'US');
  }
}
