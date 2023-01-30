import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget buildPopupDialog(BuildContext context,String title,String content,String textfieldlabel,String textfielhint,String buttonname, TextEditingController _controller,void Function() ontap) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(top: 20, left: 20, right: 20),
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(content),
          buildTextField(textfieldlabel, textfielhint, _controller,
                  TextInputType.name, (() {
                  }))
              .pOnly(top: 20)
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: ontap,
          child: Text(buttonname),
        ),
      ],
    );
  }

  Widget buildTextField(
      String labelText,
      String placeholder,
      TextEditingController controll,
      TextInputType keyboard,
      void Function() ontap) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        keyboardType: keyboard,
        controller: controll,
        onTap: ontap,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
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
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            // borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }