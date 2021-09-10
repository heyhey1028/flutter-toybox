import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_toybox/screens/mark_down/model/document.dart';

abstract class DocumentRepository {
  Future<void> setDocumentData(Document document);
  Stream<List<Document>> getDocuments();
}

class DocumentRepositoryImpl implements DocumentRepository {
  static final DocumentRepositoryImpl _instance =
      DocumentRepositoryImpl._internal();
  factory DocumentRepositoryImpl() => _instance;
  DocumentRepositoryImpl._internal();

  Stream<List<Document>> getDocuments() {
    return FirebaseFirestore.instance.collection('documents').snapshots().map(
          (QuerySnapshot qsnapshot) => qsnapshot.docs.map(
            (QueryDocumentSnapshot qdoc) => fromDocumentSnapshot(qdoc),
          ),
        );
  }

  Future<void> setDocumentData(Document document) async {
    final Map<String, dynamic> data = {
      "title": document.title,
      "content": document.content,
    };

    await FirebaseFirestore.instance
        .collection('documents')
        .doc(document.id)
        .set(data);
  }

  Document fromDocumentSnapshot(DocumentSnapshot doc) {
    return Document(
      id: doc.id,
      title: doc['title'] as String,
      content: doc['content'] as String,
    );
  }
}
