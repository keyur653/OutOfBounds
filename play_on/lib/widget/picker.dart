import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollingPicker extends StatefulWidget {
  @override
  _ScrollingPickerState createState() => _ScrollingPickerState();
}

class _ScrollingPickerState extends State<ScrollingPicker> {
  String _selectedItem = "Item 1";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: CupertinoPicker(
        itemExtent: 40,
        backgroundColor: Colors.white,
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedItem = "Item $index";
          });
        },
        children: List<Widget>.generate(100, (index) {
          return Container(
            alignment: Alignment.center,
            child: Text("Item"),
          );
        }),
      ),
    );
  }
}
