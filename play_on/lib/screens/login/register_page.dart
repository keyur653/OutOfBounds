import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:play_on/screens/login/registration_page.dart';
import 'package:play_on/widget/button.dart';

class RegisterDemo extends StatefulWidget {
  static String id = "/Register";

  const RegisterDemo({super.key});
  @override
  RegisterDemoState createState() => RegisterDemoState();
}

class RegisterDemoState extends State<RegisterDemo> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool isspinner = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgimage.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Welcome to Play On"),
        ),
        body: ModalProgressHUD(
          inAsyncCall: isspinner,
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
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
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
                  decoration: InputDecoration(
                      icon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Password',
                      hintText: 'Enter Your Password'),
                  onChanged: (value) {
                    password = value;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ))),
                  onPressed: () async {
                    setState(() {
                      isspinner = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, RegistrationDemo.id);
                      }
                      isspinner = false;
                    } catch (e) {
                      print(e);
                    }
                    setState(() {
                      isspinner = false;
                    });
                  },
                  // style: ButtonStyle(shape: ),
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                ),
              ),
              // Divider(),
              const SizedBox(
                height: 10,
              ),
              SignInButton(
                padding: const EdgeInsets.only(right: 15, left: 15),
                Buttons.Google,
                onPressed: () {
                  signInWithGoogle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    print(userCredential.user?.displayName);
    if (userCredential != null) {
      Navigator.pushNamed(context, RegistrationDemo.id);
    }
  }
}
