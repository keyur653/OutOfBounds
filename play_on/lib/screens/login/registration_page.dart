import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:play_on/controller/user_data.dart';
import 'package:play_on/db%20Model/db_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:play_on/screens/login/sport_list.dart';
import 'package:play_on/db%20Model/database_service.dart';

class RegistrationDemo extends StatefulWidget {
  static String id = "/registration";
  @override
  _RegistrationDemoState createState() => _RegistrationDemoState();
}

class _RegistrationDemoState extends State<RegistrationDemo> {
  final _genderlist = ['Male', 'Female', 'Other'];
  String? gender = 'Other';
  List<Contents> rolelist = [];
  String? role = 'Player';
  final _auth = FirebaseAuth.instance;
  final refrence = FirebaseFirestore.instance;
  String? name, mbnumber, area;
  DatabaseReference obj = DatabaseReference();

  @override
  void initState() {
    super.initState();
    var roleref = obj.getDetailRef("Role");
    roleref.snapshots().listen((event) {
      if (mounted) {
        setState(() {
          for (var i = 0; i < event.docs.length; i++) {
            rolelist.add(Contents.fromSnapshot(event.docs[i]));
          }
        });
      }
    });
    getCurrentUser();
  }

  Future update() async {
    FirebaseFirestore.instance
        .collection('User')
        .doc('current')
        .collection(role!)
        .doc(loggedInUser.email)
        .set({
      'Name': name.toString().trim(),
      'MobileNum': mbnumber!.trim(),
      'Area': area!.trim(),
      'Email': loggedInUser.email!.trim(),
      'Gender': gender,
      'Sports': ["cricket", "kabaddi"],
      'Role': role!.trim(),
      'Profileurl': "hi"
    });

    await DatabaseService(uid: loggedInUser.uid)
        .savingUserData(name.toString(), loggedInUser.email.toString());
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bgimage.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("Welcome to Play On!"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Container(
                  width: 200,
                  height: 15,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Name',
                      hintText: "What's your name?"),
                  onChanged: (value) {
                    name = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Mobile No.',
                      hintText: 'Enter your Mobile No.'),
                  onChanged: (value) {
                    mbnumber = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.area_chart),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      labelText: 'Area',
                      hintText: 'Enter your Area or Pincode'),
                  onChanged: (value) {
                    area = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Gender",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                    ),
                    const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    DropdownButton<String>(
                      items: _genderlist.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValueSelected) {
                        setState(() {
                          gender = newValueSelected;
                        });
                      },
                      value: gender,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text("Role",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 81, 77, 77))),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                    ),
                    const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                    DropdownButton<String>(
                      items: rolelist
                          .map((e) => DropdownMenuItem<String>(
                              value: e.name,
                              child: Text(
                                e.name!,
                                style: const TextStyle(fontSize: 20),
                              )))
                          .toList(),
                      onChanged: (String? newValueSelected2) {
                        setState(() {
                          role = newValueSelected2;
                        });
                      },
                      value: role,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.indigo),
                        shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ))),
                    onPressed: (() {
                      update();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => Sportlist(
                                  role: role,
                                )),
                      );
                    }),
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
