import 'package:flutter/material.dart';
import 'package:play_on/screens/home_screen/Joined_activities/join_act.dart';
import 'package:play_on/screens/home_screen/design.dart';
import 'package:play_on/screens/home_screen/group/pages/home_page.dart';
import 'package:play_on/screens/home_screen/mental_health/quiz/blog.dart';
import 'package:play_on/screens/home_screen/mental_health/quiz/quiz.dart';
import 'package:play_on/screens/home_screen/mental_health/quiz/start_quiz_screen.dart';
import 'package:play_on/screens/home_screen/my_activities/my_activity.dart';
import 'package:play_on/screens/home_screen/mental_health/workout/workout_screen.dart';

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
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => MyActivity(
            details: widget.details, sportdetails: widget.sportdetails))));
  }

  void joinactivity() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => JoinActivity(
            details: widget.details, sportdetails: widget.sportdetails))));
  }

  void groups() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => GroupHomePage(details: widget.details))));
  }

  void mental_health() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => StartQuiz())));
  }

  void blog() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => Blog2())));
  }

  void workout() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: ((context) => WorkoutScreen())));
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Design(text: "My activity", ontap: myactivity),
          Design(text: "Joined Activities", ontap: joinactivity),
          Design(text: "Groups", ontap: groups),
          Design(text: "mental_health", ontap: mental_health),
          Design(text: "blog", ontap: blog),
          Design(text: "workout", ontap: workout),

        ],
      ),
    );
  }
}
