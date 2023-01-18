import 'package:flutter/material.dart';
import 'package:play_on/screens/home_screen.dart';
import 'package:play_on/screens/login_page.dart';
import 'package:play_on/screens/profile_screen.dart';
import 'package:play_on/screens/registration_page.dart';
import 'package:play_on/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // if u want to use a any flutterfire command then before it u have to intialize app
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
        LoginDemo.id: (context) => LoginDemo(),
        RegistrationDemo.id: (context) => RegistrationDemo(),
        homescreen.id:(context) => homescreen(),
      },
    );
  }
}
