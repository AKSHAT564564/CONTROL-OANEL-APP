import 'package:flutter/material.dart';
import 'package:intern_project/pages/home_page.dart';
import 'package:intern_project/pages/profile_page.dart';
import 'package:intern_project/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.blueAccent,
      ),
      home:const MyHomePage(),
    );
  }
}
