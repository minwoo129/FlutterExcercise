import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'memo.dart';
import 'memo_add.dart';

class MemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoPage();
}

class _MemoPage extends State<MemoPage> {
  FirebaseDatabase? _database;
  DatabaseReference? reference;
  String _databaseUrl = 'https://flutterex-705b5-default-rtdb.firebaseio.com/';
  List<Memo> memos = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    _database = FirebaseDatabase(databaseURL: _databaseUrl);
    reference = _database!.reference().child('memo');
    reference!.onChildAdded.listen((event) {
      print('================= connected ====================');
      print(event.snapshot.value.toString());
      setState(() {
        memos.add(Memo.fromSnapshot(event.snapshot));
      });
    });

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('메모 앱')
      ),
      body: Container(
        child: Center(
          child: memos.length == 0 ? 
            CircularProgressIndicator()
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
                          child: Text(memos[index].content.toString()),
                        )
                      ),
                    ),
                    header: Text(memos[index].title.toString()),
                    footer: Text(memos[index].createTime.toString().substring(0,10)),
                  ),
                );
              },
              itemCount: memos.length,
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => MemoAddPage(reference!)));
        },
        child: Icon(Icons.add)
      ),
    );
  }
}