// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:play_on/create_activity/area.dart';
import 'package:play_on/create_activity/select_sport.dart';
import 'package:play_on/create_activity/time.dart';

import 'package:velocity_x/velocity_x.dart';

class Create extends StatefulWidget {
  static String id = "/create";
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  String time = "Pick Exact Time";
  String date = "Pick a Day";
  String sport = "Eg.Badminton/Cricket/Football";
  String area = "Locality or Venue";
  String access = "";
  TextEditingController _controllerCost = TextEditingController();
  TextEditingController _controllerTplayer = TextEditingController();
  CategoryType categoryType = CategoryType.public;
  bool isSwitched = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  late DateTime currentDateTime = DateTime.now(),
      initialDateTime,
      firstDateTime,
      lastDateTime;

  @override
  void initState() {
    super.initState();
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
    }
  }

  void datepicker() {
    initialDateTime = currentDateTime;
    firstDateTime = currentDateTime;
    lastDateTime = currentDateTime.add(Duration(days: (5 * 365)));
    showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: firstDateTime,
      lastDate: lastDateTime,
    ).then((newDateTime) {
      if (newDateTime != null) {
        setState(() {});
        date = DateFormat('dd-MM-yyyy').format(newDateTime);
      }
    });
  }

  void timepicker() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Time()))
        .then((value) {
      if (value is String) {
        setState(() {
          time = value;
        });
      }
    });
  }

  void selectsport() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => SelectSport(role: "Player")))
        .then((value) {
      if (value is String) {
        setState(() {
          sport = value;
        });
      }
    });
  }

  void selectarea() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => Area()))
        .then((value) {
      if (value is String) {
        setState(() {
          area = value;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: (() {}),
              child: "Create Activity"
                  .text
                  .bold
                  .textStyle(TextStyle(fontSize: 15))
                  .make())
          .px(8)
          .wFull(context),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        leading: TextButton(
            onPressed: (() {}),
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.green,
            )),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            "Create Activity".text.bold.scale(2).make(),
            SizedBox(
              height: 15,
            ),
            createCard(
              Icons.sports,
              "Sport",
              sport,
              selectsport,
            ),
            Divider(
              height: 0.0,
            ),
            createCard(Icons.location_city_outlined, "Area", area, selectarea),
            Divider(
              height: 0.0,
            ),
            createCard(
              Icons.date_range,
              "Date",
              date,
              datepicker,
            ),
            Divider(
              height: 0.0,
            ),
            createCard(
              Icons.access_time_rounded,
              "Time",
              time,
              timepicker,
            ),
            Divider(
              height: 0.0,
            ),
            ListTile(
                leading: Icon(
                  Icons.sports,
                ),
                title: "Activity Access".text.semiBold.make(),
                subtitle: Row(
                  children: <Widget>[
                    getButtonUI(CategoryType.public,
                        categoryType == CategoryType.public),
                    const SizedBox(
                      width: 16,
                    ),
                    getButtonUI(CategoryType.invite,
                        categoryType == CategoryType.invite),
                  ],
                ).py12(),
                trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                )),
            Divider(
              height: 0.0,
            ),
            createCard(Icons.settings, "Advanced Setting", "", (() {})),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  switchforpay("Pay and join", isSwitched, toggleSwitch),
                  isSwitched == true
                      ? buildTextField("Cost Per Player", _controllerCost)
                          .px12()
                          .py12()
                      : SizedBox(),
                  buildTextField("Total Players", _controllerTplayer)
                      .px12()
                      .py12()
                ],
              ),
            ).pOnly(right: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  "Add Instruction".text.fontWeight(FontWeight.w500).make(),
                  getcheckbox(
                      "Bring Yuor Own Equipments", Icons.backpack, isSelected1,
                      ((value) {
                    setState(() {
                      isSelected1 = isSelected1.toggle();
                    });
                  })),
                  getcheckbox("Cost Shared", Icons.money, isSelected2,
                      ((value) {
                    setState(() {
                      isSelected2 = isSelected2.toggle();
                    });
                  })),
                  getcheckbox("Vaccinated Players Preffered", Icons.vaccines,
                      isSelected3, ((value) {
                    setState(() {
                      isSelected3 = isSelected3.toggle();
                    });
                  })),
                ],
              ).px20().py12(),
            ).pOnly(right: 10),
          ],
        ).pOnly(top: 10, left: 15),
      ).pOnly(bottom: 45),
    );
  }

  Widget getcheckbox(String title, IconData icon, bool isSelected,
      void Function(bool?) istoggle) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: title.text.make(),
      trailing: Checkbox(
          activeColor: Colors.green, value: isSelected, onChanged: istoggle),
    );
  }

  Widget buildTextField(String labelText, TextEditingController control) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff5f5f5), width: 2.0),
          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xfff5f5f5), width: 2.0),
          // borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
      ),
    );
  }

  Widget getButtonUI(CategoryType categoryTypeData, bool isSelected) {
    String txt = '';
    if (CategoryType.public == categoryTypeData) {
      txt = 'Public';
    } else if (CategoryType.invite == categoryTypeData) {
      txt = 'Invite Only';
    }
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            border: Border.all(color: Colors.green)),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white24,
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            onTap: () {
              setState(() {
                categoryType = categoryTypeData;
                access = txt;
                print(access);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 18, right: 18),
              child: Center(
                child: Text(
                  txt,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.27,
                    color: isSelected ? Colors.white : Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createCard(
      IconData icon, String title, String subtitle, void Function() ontap) {
    return ListTile(
        leading: Icon(
          icon,
        ),
        onTap: ontap,
        title: title.text.make(),
        subtitle: subtitle.text.make(),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
        ));
  }
}

Padding switchforpay(String title, bool isSwitched,
    void Function(bool isSwitched) toggleSwitch) {
  return Card(
    child: ListTile(
        leading: Icon(Icons.payment),
        title: "Pay And Join".text.make(),
        trailing: CupertinoSwitch(
          value: isSwitched,
          onChanged: toggleSwitch,
          activeColor: Colors.green,
          dragStartBehavior: DragStartBehavior.start,
        )),
  ).pOnly(top: 10, right: 8, left: 8);
}

enum CategoryType {
  public,
  invite,
}