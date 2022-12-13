import 'package:flutter/material.dart';
import 'package:play_on/welcome_screen.dart';


void main() async{
  // if u want to use a any flutterfire command then before it u have to intialize app
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        hintColor: Colors.black
      ),
      initialRoute: WelcomeScreen.id,
      routes: {
      //  ChatScreen.id:(context) => const ChatScreen(),
      //  LoginScreen.id:(context) => const LoginScreen(),
      //  RegistrationScreen.id:(context) => const RegistrationScreen(),
       WelcomeScreen.id:(context)=>const WelcomeScreen(),
      },
    );
  }
}

