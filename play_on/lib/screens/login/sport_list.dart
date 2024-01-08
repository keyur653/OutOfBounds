// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/process_data.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:velocity_x/velocity_x.dart';

class Sportlist extends StatefulWidget {
  final String? role;
  static String id = "/sport";
  const Sportlist({
    Key? key,
    required this.role,
  }) : super(key: key);

  @override
  State<Sportlist> createState() => _SportlistState();
}

class _SportlistState extends State<Sportlist> {
  List<Contents> Sportdata = [];
  List<Widget> sportlist = [];
  List userSport = [];
  bool check = false;
  DatabaseReference obj = DatabaseReference();

  final Map<String, IconData> _sportIcons = {
    "Football": Icons.sports_soccer_outlined,
    "Basketball": Icons.sports_basketball_outlined,
    "Tennis": Icons.sports_tennis_outlined,
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
            userSport.add(Sportdata[i].name!);
          }),
          child: Column(
            children: [
              Icon(
                
                _sportIcons[Sportdata[i].name],
                size: 30,
                color: Colors.black,
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

  Future update() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc('current')
        .collection(widget.role!)
        .doc(loggedInUser.email)
        .update({
      'Sports': userSport,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: TextButton(
              onPressed: (() {}),
              child: const Icon(Icons.arrow_back_ios_new_rounded)),
          actions: [
            ElevatedButton(
                    onPressed: (() {
                      update();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => ProcessData(widget.role)),
                      );
                    }),
                    child: const Text("done"))
                .pOnly(top: 8, bottom: 8)
                .w24(context),
            const SizedBox(
              width: 10,
            )
          ],
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
              trailing: Checkbox(
                  value: check,
                  onChanged: ((value) {
                    setState(() {
                      check = check.toggle();
                    });
                  })),
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
