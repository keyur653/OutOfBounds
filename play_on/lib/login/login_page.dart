import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/login/register_page.dart';
import 'package:play_on/login/reset_screen.dart';
import 'package:play_on/screens/profile/profile_screen.dart';
import 'package:play_on/login/registration_page.dart';

import '../controller/process_data.dart';

class LoginDemo extends StatefulWidget {
  static String id = "/login";

  const LoginDemo({super.key});
  @override
  LoginDemoState createState() => LoginDemoState();
}

class LoginDemoState extends State<LoginDemo> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgimage.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Welcome Back!"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                      hintText: 'Enter registered email id'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Your Password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  //TODO FORGOT PASSWORD SCREEN GOES HERE
                  Navigator.pushNamed(context, ResetScreen.id);
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        getCurrentUser();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => ProcessData("Player")),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, RegisterDemo.id);
                },
                child: const Text(
                  'New to Play On? Create Account',
                  style: TextStyle(
                      color: Color.fromARGB(255, 31, 212, 52), fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
