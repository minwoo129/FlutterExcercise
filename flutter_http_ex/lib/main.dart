import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'dart:convert';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // TODO: implement createHttpClient
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}
void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpApp()
    );
  }
}

class HttpApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HttpApp();
}

class _HttpApp extends State<HttpApp> {
  String result = '';
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = new List.empty(growable: true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Example'),
      ),
      body: Container(
        child: Center(
          child: data.length == 0 ?
            Text('데이터가 없습니다.',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center) :
          ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Text(data[index]['title'].toString()),
                    Text(data[index]['authors'].toString()),
                    Text(data[index]['sale_price'].toString()),
                    Text(data[index]['status'].toString()),
                    Image.network(
                      data[index]['thumbnail'],
                      height: 100,
                      width: 100,
                      fit: BoxFit.contain
                    )
                  ],
                ),
              );
            }, itemCount: data.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = "https://dapi.kakao.com/v3/search/book?target=title&query=doit";
    var response = await http.get(Uri.parse(url),
      headers: {"Authorization" : "KakaoAK 2555e6f9c3662df60f68f0aa9d75597d"}
    );
    //print(response.body);
    setState(() {
      var dataConvertedToJSON = json.decode(response.body);
      List result = dataConvertedToJSON['documents'];
      data.addAll(result);
    });
    return response.body;
  }
}
