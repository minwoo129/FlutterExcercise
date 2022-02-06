import 'package:flutter/material.dart';
import 'package:todo_list/SecondDetail.dart';
import 'package:todo_list/SubDetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static const String _title = 'Widget Example';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => SubDetail(),
        '/second': (context) => SecondDetail(),
      },
    );
  }
}

