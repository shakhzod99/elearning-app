import 'package:algolearn/screens/home_screen.dart';
import 'package:algolearn/utils/const.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning Online Courses App',
      debugShowCheckedModeBanner: false,
      theme: Constants.lighTheme(context),
      home: HomeScreen(),
    );
  }
}