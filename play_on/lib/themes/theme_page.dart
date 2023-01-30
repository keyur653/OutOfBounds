import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'package:velocity_x/velocity_x.dart';

class Mythemes {
  static ThemeData get lightTheme => ThemeData(
        primaryColor: Colors.green,
        secondaryHeaderColor: darkBluishColor,
        cardColor: Vx.white,
        canvasColor: creamcolor,
        buttonColor: darkBluishColor,
        appBarTheme: AppBarTheme(
            backgroundColor: creamcolor,
            elevation: 0.0,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 22),
            iconTheme: IconThemeData(color: Colors.black)),
        primarySwatch: Colors.deepPurple,
      );

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkcreamcolr = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Color.fromARGB(255, 73, 75, 232);

  static ThemeData get darkTheme => ThemeData(
        primaryColor: Colors.green,
        brightness: Brightness.dark,
        secondaryHeaderColor: Colors.white,
        cardColor: Vx.black,
        canvasColor: darkcreamcolr,
        buttonColor: Vx.indigo200,
        appBarTheme: AppBarTheme(
            backgroundColor: darkcreamcolr,
            elevation: 0.0,
            titleTextStyle: TextStyle(color: darkcreamcolr, fontSize: 22),
            iconTheme: IconThemeData(color: Colors.white)),
        // brightness: Brightness.dark
      );
}
