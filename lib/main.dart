import 'package:brand_web_demo/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // fontFamily: 'SanFransisco',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
