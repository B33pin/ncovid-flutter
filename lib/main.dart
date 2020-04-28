import 'package:flutter/material.dart';
import 'package:ncovid19/Screens/home_screen.dart';
import 'package:ncovid19/Screens/loading_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ncovid19',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.deepPurpleAccent
      ),
      home: LoadingScreen(),
    );
  }
}
