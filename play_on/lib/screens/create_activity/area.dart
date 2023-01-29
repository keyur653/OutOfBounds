import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:velocity_x/velocity_x.dart';

class Area extends StatefulWidget {
  const Area({super.key});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white10,
        leading: TextButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            child: Icon(Icons.arrow_back_ios_new_rounded)),
        title: "Select Area".text.black.make(),
      ),
      body: Column(children: [
        buildTextField("Area", "Eg.Borivali", () {}, _controller)
            .pOnly(top: 80, left: 15, right: 15),
        ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: (() {
                  Navigator.pop(context, "${_controller.text}".trim());
                }),
                child: "Enter".text.make())
            .w32(context)
      ]),
    );
  }

  Widget buildTextField(String labelText, String placeholder,
      void Function() ontap, TextEditingController control) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 25.0),
        child: TextField(
          controller: control,
          onTap: ontap,
          keyboardType: TextInputType.name,
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
