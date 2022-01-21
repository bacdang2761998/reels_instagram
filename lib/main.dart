import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reels_instagram/screen/login/login_screnn.dart';

Future<void> main() async {
  runApp(MyApp());
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginScreen(),
    );
  }
}
