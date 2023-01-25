// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:play_on/create_activity/create.dart';
import 'package:play_on/screens/find_players.dart';
import 'package:play_on/screens/home_screen.dart';
import 'package:play_on/screens/profile_screen.dart';

class UserBottomNav extends StatefulWidget {
  final List<String> details;
  final List sportdetails;
  const UserBottomNav({
    Key? key,
    required this.details,
    required this.sportdetails,
  }) : super(key: key);
  @override
  _UserBottomNavState createState() => _UserBottomNavState();
}

class _UserBottomNavState extends State<UserBottomNav> {
  int _currentIndex = 0;
  List<Widget> _children = [];
  void createlist() {
    _children = [
      const HomeScreen(),
      FindPlayerpage(
          details: widget.details, sportdetails: widget.sportdetails),
      Create(details: widget.details, sportdetails: widget.sportdetails),
      ProfileScreen(details: widget.details, sportdetails: widget.sportdetails)
    ];
  }

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        title: const Text(
          'Do you want to exit..?',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        actions: <Widget>[
          CloseButton(
            onPressed: () => Navigator.of(context).pop(false),
            color: Colors.red,
          ),
          const SizedBox(height: 16),
          IconButton(
            onPressed: () async {
              await SystemNavigator.pop();
            },
            icon: const Icon(
              Icons.check,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
    ).then((value) => value);
  }

  @override
  void didChangeDependencies() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    createlist();
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: onTappedBar,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Find',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create),
              label: 'Create',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
