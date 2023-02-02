// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:play_on/screens/login/reset_screen.dart';
import 'package:play_on/welcome_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            const Text(
              "Settings",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password", (() {
              Navigator.pushNamed(context, ResetScreen.id);
            })),
            buildAccountOptionRow(context, "Content settings", (() {})),
            buildAccountOptionRow(context, "Social", (() {})),
            buildAccountOptionRow(context, "Language", (() {})),
            buildAccountOptionRow(context, "Privacy and security", (() {})),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              height: 15,
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 40)),
                    backgroundColor: MaterialStatePropertyAll(Colors.green),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)))),
                onPressed: () async {
                  // await GoogleSignIn().signOut();
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
                child: const Text("SIGN OUT",
                    style: TextStyle(
                        fontSize: 16, letterSpacing: 2.2, color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, void Function() ontap) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
