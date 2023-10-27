// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/process_data.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:velocity_x/velocity_x.dart';

class EditSport extends StatefulWidget {
  final String? role;
  const EditSport({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<EditSport> createState() => _EditSportState();
}

class _EditSportState extends State<EditSport> {
  List<Contents> Sportdata = [];
  List<Widget> sportlist = [];
  List userSport = [];
  bool check = false;
  DatabaseReference obj = DatabaseReference();

  final Map<String, IconData> _sportIcons = {
    "soccer": Icons.sports_soccer_outlined,
    "basketball": Icons.sports_basketball_outlined,
    "tennis": Icons.sports_tennis_outlined,
    "cricket": Icons.sports_cricket_outlined,
    "football": Icons.sports_football_outlined,
    "volleyball": Icons.sports_volleyball_outlined,
    "hockey": Icons.sports_hockey_outlined,
    "handball": Icons.sports_handball_outlined,
    "kabaddi": Icons.sports_kabaddi_outlined,
    "baseball": Icons.sports_baseball_outlined
    // Add more sports
  };

  void getlist() {
    for (var i = 0; i < Sportdata.length; i++) {
      sportlist.add(TextButton(
          onPressed: (() {
            userSport.add(Sportdata[i].name!);
          }),
          child: Column(
            children: [
              Icon(
                _sportIcons[Sportdata[i].name],
                size: 30,
                color: Colors.black,
              ),
              Text(
                "${Sportdata[i].name}",
                style: TextStyle(color: Colors.black),
              )
            ],
          )));
    }
  }

  @override
  void initState() {
    super.initState();
    var sportref = obj.getDetailRef("Sport");
    print(sportref);
    sportref.snapshots().listen((event) {
      if (mounted) {
        setState(() {
          for (var i = 0; i < event.docs.length; i++) {
            Sportdata.add(Contents.fromSnapshot(event.docs[i]));
          }
        });
        getlist();
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [
            ElevatedButton(
                    onPressed: (() {
                      Navigator.pop(context, userSport);
                    }),
                    child: Text("done"))
                .pOnly(top: 8, bottom: 8)
                .w24(context),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.rectangle,
                color: Colors.green,
              ),
              title: "Team Sports".text.bold.make(),
              trailing: Checkbox(
                  value: check,
                  onChanged: ((value) {
                    setState(() {
                      check = check.toggle();
                    });
                  })),
            ),
            Divider(
              endIndent: 8.0,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: sportlist,
            )
          ],
        ));
  }
}
