import 'package:flutter/material.dart';
import 'package:flutter_app2/get_data.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Color primaryColor = const Color(0xff009689);
  final Color secondryColor = const Color(0xff5c7d89);
  final Color backgroundColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: backgroundColor,
        primaryColor: primaryColor,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: secondryColor),
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 50.0, fontWeight: FontWeight.bold, color: Colors.white),
          bodyText2: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
          button: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),

        ),

      home: GetData(),
    );
  }
}
