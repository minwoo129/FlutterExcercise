import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WidgetApp()
    );
  }
}

class WidgetApp extends StatefulWidget {
  @override
  _WidgetExampleState createState() => _WidgetExampleState();
}

class _WidgetExampleState extends State<WidgetApp> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Example'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(15),
                  child: Text('flutter'),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(),
              ),
              Padding(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(child: const Text(''), onPressed: () {

                  },),
              )
            ],
          ),
        ),
      ),
    );
  }
}

