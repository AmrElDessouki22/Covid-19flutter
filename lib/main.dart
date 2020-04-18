import 'package:flutter/material.dart';

import 'MyHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutte chat ui ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Color(0xFFFEF9EB),
        primaryColor: Colors.red,
      ),
      home: MyHomePage(),

    );
  }

}



