import 'package:firebasememo/memoadd.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'memo.dart';

class MemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoPage();
}

class _MemoPage extends State<MemoPage> {
  String _databaseURL = 'https://fluttermemo-4c29c-default-rtdb.firebaseio.com/';
  FirebaseDatabase _database = FirebaseDatabase(databaseURL: 'https://fluttermemo-4c29c-default-rtdb.firebaseio.com/');
  DatabaseReference? reference;
  List<Memo> memos = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _database.reference().child('memo').set({
      'title': '테스트',
      'content': '테스트1',
      'createTime': DateTime.now().toString()
    }).then((value) {
      print('================== result ===================');
    });
    //_database = FirebaseDatabase(databaseURL: _databaseURL);
    // print('=================== database =====================');
    // print(_database.toString());
    // reference = _database!.reference().child('memo');

    // reference!.set(Memo('테스트', '테스트1테스트2,테스트3', DateTime.now().toIso8601String()).toJson()).then((value) {
    //   print('================ result ===============');
      
    // }).catchError((onError) {
    //   print('============== error =================');
    //   print(onError);
    // });
    // reference!.onChildAdded.listen((event) {
    //   print(event.snapshot.value.toString());
    //   setState(() {
    //     memos.add(Memo.fromSnapshot(event.snapshot));
    //   });
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 앱'),
      ),
      body: Container(
        child: Center(
          child: memos.length == 0 
            ? CircularProgressIndicator()
            : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: SizedBox(
                        child: GestureDetector(
                          onTap: () {

                          },
                          onLongPress: () {

                          },
                          child: Text(memos[index].content),
                        )
                      )
                    ),
                    header: Text(memos[index].title),
                    footer: Text(memos[index].createTime.substring(0,10)),
                  )
                );
              },
              itemCount: memos.length,
            )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemoAddPage(reference!)));
          reference!.set({
            "title": "테스트",
            "content": "테스트1테스트2테스트3",
            "createTime": DateTime.now().toIso8601String()
          });
        },
        child: Icon(Icons.add),
      )
    );
  }
}