import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/widget/bottom_navigation.dart';

class ProcessData extends StatefulWidget {
  final String? role;

  const ProcessData(this.role);

  @override
  _ProcessDataState createState() => _ProcessDataState();
}

class _ProcessDataState extends State<ProcessData> {
  final reference = FirebaseFirestore.instance;
  List<String> details = [];
  List sportdetails = [];

  Future<List> stream() async {
    var ref = reference
        .collection('User')
        .doc('current')
        .collection(widget.role!)
        .doc(loggedInUser.email);
    print(ref);

    ref.snapshots().listen((event) async {
      details
        ..add(event.data()!['Name'])
        ..add(event.data()!['MobileNum'])
        ..add(event.data()!['Role'])
        ..add(event.data()!['Gender'])
        ..add(event.data()!['Area'])
        ..add(event.data()!['Email'])
        ..add(event.data()!['Profileurl']);

      sportdetails = event.data()!['Sports'];
      print(details);

      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (_) => UserBottomNav(
                  details: details,
                  sportdetails: sportdetails,
                )),
      );
    });
    return details;
  }

  @override
  void initState() {
    super.initState();
    stream();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }
}
