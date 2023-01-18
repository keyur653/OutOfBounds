
import 'package:flutter/material.dart';
import 'package:play_on/screens/login_page.dart';
import 'package:play_on/screens/registration_page.dart';
import 'package:velocity_x/velocity_x.dart';

import 'widget/button.dart';


class WelcomeScreen extends StatefulWidget {
  static String id = "/welcome";
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animationn;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    animationn =
        ColorTween(begin: Colors.white, end: Colors.blue).animate(controller!);
    controller!.forward();
    controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101010),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/login_image.jpg"), fit: BoxFit.fill)),
        constraints: const BoxConstraints.expand(),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "PlayOn",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 45.0,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            Button(
              controller: null,
              bcolor: Colors.lightBlueAccent,
              buttonname: "Log In",
              onpressd: () {
                Navigator.pushNamed(context, LoginDemo.id);
              },
            ).px(22),
            Button(
                controller: null,
                bcolor: Colors.blueAccent,
                buttonname: "Register",
                onpressd: () {
                  Navigator.pushNamed(context, RegistrationDemo.id);
                }).px(22)
          ],
        ),
      ),
    );
  }
}