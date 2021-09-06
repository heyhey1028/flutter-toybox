import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_toybox/screens/mark_down/model/document.dart';

class DocumentRepository {
  Future<void> setDoucmentData(Document document) async {
    final Map<String, dynamic> data = {
      "title": document.title,
      "content": document.content,
    };

    await FirebaseFirestore.instance
        .collection('documents')
        .doc(document.id)
        .set(data);
  }
}
