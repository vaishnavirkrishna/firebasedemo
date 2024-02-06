import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homescreen/home_screen.dart';
import 'package:flutter_application_1/view/splash.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _RegistrationState();
}

class _RegistrationState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "email"),
                controller: emailController,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "password"),
                controller: passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        try {
                          final credential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text);
                          if (credential.user?.uid != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Splash()));
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      child: Text("login"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
