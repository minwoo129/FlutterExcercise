import 'package:firebase_database/firebase_database.dart';

class Memo {
  String? key;
  String title;
  String content;
  String createTime;

  Memo(this.title, this.content, this.createTime);

  Memo.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value['title'].toString(),
        content = snapshot.value['content'].toString(),
        createTime = snapshot.value['createTime'].toString();

  toJson() {
    return {
      'title': title,
      'content': content,
      'createTime': createTime,
    };
  }
}