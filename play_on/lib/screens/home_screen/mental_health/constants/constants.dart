import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const kPrimaryColor = Color(0xFFFF3B1D);
const kDarkBlackColor = Color(0xFF191919);
const kBgColor = Color(0xFFE7E7E7);
const kBodyTextColor = Color(0xFF666666);

const kDefaultPadding = 20.0;
const kMaxWidth = 1232.0;
const kDefaultDuration = Duration(milliseconds: 250);


String userEmail = "akshay123@gamil.com";
Map<String, dynamic> map={};


Future<void> getUser(String email) async {
  print(email);
  final Uri registrationUrl = Uri.parse('https://sih.shreeraj.me/profile');
  final Map<dynamic, dynamic> registrationData = {
    'email': email,
  };
  try {
    final response = await http.post(
      registrationUrl,
      body: registrationData,
    );

    if (response.statusCode == 200) {
      // Registration successful, handle the response here.
      // You can navigate to the next screen or perform any necessary actions.
      map = jsonDecode(response.body);
    } else {
      final errorMessage = json.decode(response.body);
      print(errorMessage);
    }
  } catch (e) {
    // Handle any exceptions that occur during the HTTP request.
    print('Error: $e');
  }
}
