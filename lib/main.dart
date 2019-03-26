import 'package:flutter/material.dart';
import 'package:instagram_clone/insta_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Instagram Clone",
      debugShowCheckedModeBanner: false,
      home: new InstaHome(),
      theme: new ThemeData(
        primaryColor: Colors.black,
        primaryIconTheme: IconThemeData(color: Colors.black),
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.black, fontFamily: "Aveny"))),
    );
  }
}
