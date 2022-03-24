import 'package:flutter/material.dart';
import 'memo.dart';

class MemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MemoPage();
}

class _MemoPage extends State<MemoPage> {
  //FirebaseFirestore firestore = FirebaseFirestore.instance;
  //final Stream<QuerySnapshot> firestore = FirebaseFirestore.instance.collection('memo').snapshots();
  //List<Memo> memos = new List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    // firestore.listen((event) {
    //   print('===============');
    //   print(event);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('firestore'),
      ),
      body: Container(),
    );
  }
}