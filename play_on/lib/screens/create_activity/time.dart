// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Time extends StatefulWidget {
  const Time({super.key});

  @override
  State<Time> createState() => _TimeState();
}

class _TimeState extends State<Time> {
  TimeOfDay currentime = TimeOfDay.now();
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String stime = "12:01";
  String etime = "16:01";

  @override
  void stimepicker() async {
    await showTimePicker(context: context, initialTime: currentime)
        .then((newTime) {
      if (newTime != null) {
        setState(() {});

        _controller1.text = newTime.toString().substring(10, 15);
      }
    });
  }

  void etimepicker() async {
    await showTimePicker(context: context, initialTime: currentime)
        .then((newTime) {
      if (newTime != null) {
        setState(() {});

        _controller2.text = newTime.toString().substring(10, 15);
        Navigator.pop(context,"${_controller1.text} to ${_controller2.text}");
      }
    });
  }

  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      title: const Text('Select Time'),
      content: Row(
        children: [
          buildTextField("Start Time", stime, stimepicker, _controller1)
              .expand(),
          SizedBox(
            width: 8,
          ),
          buildTextField("End Time", etime, etimepicker, _controller2).expand(),
        ],
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      void Function() ontap, TextEditingController control) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 35.0),
        child: TextField(
          controller: control,
          onTap: ontap,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
              // borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2.0),
              // borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
        ));
  }
}
