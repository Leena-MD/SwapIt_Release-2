import 'dart:convert';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:http/http.dart';
class SendMessage{

//this is send Notification using FCM 
  static Future<bool> sendFcmMessage(String title, String message,String fcmToken) async {
    try {
      
      var url = 'https://fcm.googleapis.com/fcm/send';
      var header = {
        "Content-Type": "application/json",
        "Authorization":
            "key=AAAAV_DbcBc:APA91bGk5VOeJVpN7ZEYlMbK_1vHJ3NwnDOQDsSn0Pa-CUMnp06Q8EBflcW1HYh4lwhNnpXJc5sUBnYVn27izjVvlGaFnKDEu_gjMSsbYK5y1JO8JGHesGNbseoiAUcok5hH3pm-HuYG",
      };
      var request = {
      'notification': {'title': title, 'body': message},
      'data': {
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'type': 'COMMENT'
      },
      'to': fcmToken
    };

      var client = new Client();
      var response =
          await client.post(Uri.parse(url), headers: header, body: json.encode(request));
      return true;
    } catch (e, s) {
      print(e);
      return false;
    }
}
static void notifiy(String title,String message) async {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'key1',
          title: title,
          body: message,
          //icon:'assets/bookshelf.png'
      )
  );
  
}
}