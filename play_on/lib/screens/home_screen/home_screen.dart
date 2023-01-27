// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/screens/home_screen/design.dart';
import 'package:play_on/screens/home_screen/my_activity.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/home";
  final List<String> details;
  final List sportdetails;
  const HomeScreen({
    Key? key,
    required this.details,
    required this.sportdetails,
  }) : super(key: key);
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void myactivity() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => MyActivity(details: widget.details, sportdetails: widget.sportdetails))));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [Design(text: "My activity", ontap: myactivity)],
      ),
    );
  }
}
