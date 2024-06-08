import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title ${message.notification!.title}');
  print('Body ${message.notification!.body}');
  print('Payload ${message.data}');
}


class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();

    final FCMtoken = await _firebaseMessaging.getToken();
    print("TOKEN $FCMtoken");

    FirebaseMessaging.onMessage.listen((event) {
      print("Event : ${event.notification!.title}");
    });
  }
}