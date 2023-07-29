import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/utils.dart';
import 'package:meal_monkey/core/data/models/apis/notification_model.dart';
import 'package:meal_monkey/core/enums/app_state.dart';
import 'package:meal_monkey/core/enums/notification_type.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class NotificationService {
  StreamController<NotificationModel> notifcationStream =
      StreamController<NotificationModel>.broadcast();

  NotificationService() {
    onInit();
  }

  void onInit() async {
    if (GetPlatform.isIOS) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        await registerdFCMToken();
      } else {
        return;
      }
    } else {
      await registerdFCMToken();
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationModel model = NotificationModel.fromJson(message.data);
      handelNotification(model: model, appState: AppState.FOREGROUND);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      NotificationModel model = NotificationModel.fromJson(message.data);
      handelNotification(model: model, appState: AppState.BACKGROUND);
    });
  }

  Future<void> registerdFCMToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    //! -- Call api that register fcm token ---

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      //! -- Call api that register fcm token ---
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });
  }

  void handelNotification(
      {required NotificationModel model, required AppState appState}) {
    notifcationStream.add(model);
    if (model.notificationType == NotificationType.SUBSCRIPTION.name) {
      storage.setSubStatus(model.subStatus == "1" ? true : false);
    }
  }
}
