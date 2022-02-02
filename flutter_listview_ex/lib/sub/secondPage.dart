import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondApp();
  List<Animal>? list;
  SecondApp({Key? key, @required this.list}) : super(key: key);
}

class _SecondApp extends State<SecondApp> {
  final nameController = TextEditingController();
  int? _radioValue = 0;
  bool? flyExist = false;
  String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: nameController,
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
              Row(
                children: <Widget>[
                  Radio(value: 0, groupValue: _radioValue, onChanged: _radioChange),
                  Text('양서류'),
                  Radio(value: 1, groupValue: _radioValue, onChanged: _radioChange),
                  Text('파충류'),
                  Radio(value: 2, groupValue: _radioValue, onChanged: _radioChange),
                  Text('포유류')
                ],
              ),
              Row(
                children: <Widget>[
                  Text('날 수 있나요?'),
                  Checkbox(
                      value: flyExist,
                      onChanged: (bool? check) {
                        setState(() {
                          flyExist = check;
                        });
                      }
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset('repo/images/cow.png', width: 80),
                    onTap: () {
                      _imagePath = 'repo/images/cow.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/pig.png', width: 80),
                    onTap: () {
                      _imagePath = 'repo/images/pig.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/bee.png', width: 80),
                    onTap: () {
                      _imagePath = 'repo/images/bee.png';
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('repo/images/cat.png', width: 80),
                    onTap: () {
                      _imagePath = 'repo/images/cat.png';
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
              ElevatedButton(
                child: Text('동물 추가하기'),
                onPressed: () {

                },
              )
            ],
          ),
        ),
      ),
    );
  }
  _radioChange(int? value) {
    setState(() {
      _radioValue = value;
    });
  }

}