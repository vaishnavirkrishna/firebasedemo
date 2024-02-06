import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homescreen/home_screen.dart';
import 'package:flutter_application_1/view/imagescreen/imagescreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Text("CRUD"),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCamera()),
              );
            },
            child: Text("IMAGE UPLOADING"),
          ),
        ]),
      ),
    );
  }
}
