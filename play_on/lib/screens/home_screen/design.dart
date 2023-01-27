// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Design extends StatefulWidget {
  final String text;
  final void Function() ontap;
  const Design({
    Key? key,
    required this.text,
    required this.ontap,
  }) : super(key: key);

  @override
  State<Design> createState() => _DesignState();
}

class _DesignState extends State<Design> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black54,
      onTap: widget.ontap,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              color: Colors.black54,
              height: 60,
              width: 60,
              fit: BoxFit.fill,
              alignment: Alignment.center,
              image: AssetImage('assets/${widget.text}.png'),
            ),
            Text(
              widget.text,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}