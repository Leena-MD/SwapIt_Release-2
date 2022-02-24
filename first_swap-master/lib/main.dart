import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_swap/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:first_swap/provider/my_provider.dart';
import 'package:first_swap/src/pages/details_page.dart';
import 'package:first_swap/src/pages/books_category.dart';
Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'key1',
          channelName: 'Proto Coders Point',
          channelDescription: "Notification Swap",
          defaultColor: Color(0XFF9050DD),
          ledColor: Colors.white,
          playSound: true,
          enableLights:true,
          enableVibration: true,
          importance: NotificationImportance.High

        )
      ]
  );
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  if (!isAllowed) {
    // This is just a basic example. For real apps, you must show some
    // friendly dialog box before call the request method.
    // This is very important to not harm the user experience
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
});
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    ),
    );
  }
}
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  print("Handling a background message: ${message.messageId}");
print(message.data);
    AwesomeNotifications().createNotification(
        content: NotificationContent( 
            id: 1,
            channelKey: 'key1', //channel configuration key
            title: message.data["title"],
            body: message.data["body"],
            displayOnForeground: true,
            displayOnBackground: true
        )
    );
  //call awesomenotification show Notify in Phone.
 AwesomeNotifications().createNotificationFromJsonData(message.data);
}
