import 'package:flutter/material.dart';
import './components/splash.dart';
import './components/home.dart';
import './components/table.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math Tables',
      theme: ThemeData(
        primaryColorDark: Color.fromRGBO(85, 173, 251, 1),
        primaryColorLight: Color.fromRGBO(254, 209, 87, 1),
        primarySwatch: Colors.blue,
        fontFamily: 'Raleway'
      ),
      home: Tables()
    );
  }
}