import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/register_login_screen/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        title: Text("REGISTER"),
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
                controller: email,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "password"),
                controller: pass,
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
                              .createUserWithEmailAndPassword(
                            email: email.text,
                            password: pass.text,
                          );
                          print(credential.user?.uid);
                          if (credential.user?.uid != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          }
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: Text('REGISTER')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
