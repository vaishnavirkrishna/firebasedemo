import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homescreen/home_screen.dart';
import 'package:flutter_application_1/view/register_login_screen/register.dart';
import 'package:flutter_application_1/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDxFLTXWfa4Q3il3Y9YgsQ3fIAi8CnuC-A',
          appId: "1:768100363778:android:6aba1afe64f0582e8d411b",
          projectId: "sample3-bdaf3",
          storageBucket: "sample3-bdaf3.appspot.com",
          messagingSenderId: ""));
  await FirebaseAppCheck.instance.activate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // User is authenticated, navigate to home screen.
            return Splash();
          } else {
            // User is not authenticated, navigate to registration screen.
            return Registration();
          }
        },
      ),
    );
  }
}


























/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homescreen/home_screen.dart';
import 'package:flutter_application_1/view/register_login_screen/register.dart';
import 'package:flutter_application_1/view/splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDxFLTXWfa4Qe3il3Y9YgsQ3fIAi8CnuC-A",
          appId: "1:768100363778:android:6aba1afe64f0582e8d411b",
          projectId: "sample3-bdaf3",
          storageBucket: "sample3-bdaf3.appspot.com",
          messagingSenderId: ""));
          await FirebaseAppCheck.instance.activate();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            return Registration();
          }),
    );
  }
}*/
