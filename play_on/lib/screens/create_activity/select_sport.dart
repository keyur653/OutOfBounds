// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:velocity_x/velocity_x.dart';

class SelectSport extends StatefulWidget {
  final String? role;
  static String id = "/sport";
  const SelectSport({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<SelectSport> createState() => _SelectSportState();
}

class _SelectSportState extends State<SelectSport> {
  List<Contents> Sportdata = [];
  List<Widget> sportlist = [];
  DatabaseReference obj = DatabaseReference();

  final Map<String, IconData> _sportIcons = {
    "Running": Icons.sports,
    "Cycling": Icons.motorcycle_rounded,
    "PowerLift": Icons.sports_tennis_outlined,
    "Cricket": Icons.sports_cricket_outlined,
    "Rugby": Icons.sports_football_outlined,
    "Volleyball": Icons.sports_volleyball_outlined,
    "Hockey": Icons.sports_hockey_outlined,
    "Handball": Icons.sports_handball_outlined,
    "Kabaddi": Icons.sports_kabaddi_outlined,
    "Baseball": Icons.sports_baseball_outlined
    // Add more sports
  };

  void getlist() {
    for (var i = 0; i < Sportdata.length; i++) {
      sportlist.add(TextButton(
          onPressed: (() {
            Navigator.pop(context, "${Sportdata[i].name}");
          }),
          child: Column(
            children: [
              Icon(
                _sportIcons[Sportdata[i].name],
                size: 30,
              ),
              Text("${Sportdata[i].name}")
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
          backgroundColor: Colors.white10,
          leading: TextButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.rectangle,
                color: Colors.green,
              ),
              title: "Team Sports".text.bold.make(),
            ),
            const Divider(
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
