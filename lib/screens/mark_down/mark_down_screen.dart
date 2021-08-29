import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toybox/screens/mark_down/edit_screen.dart';
import 'package:flutter_toybox/screens/mark_down/model/document.dart';
import 'package:flutter_toybox/screens/mark_down/preview_screen.dart';
import 'package:flutter_toybox/widgets/app_scaffold.dart';

class MarkDownScreen extends StatelessWidget {
  const MarkDownScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DocumentListScreen();
  }
}

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        // height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.indigo[600],
              Colors.indigo[400],
              Colors.indigo[100],
            ],
          ),
        ),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('documents').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> data =
                      snapshot.data.docs[index].data();
                  final Document doc = Document(
                      title: data['title'] as String,
                      content: data['content'] as String);
                  return DocumentCard(
                    title: data['title'] as String,
                    onTap: () => onTapCard(context, doc),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff03dac6),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => EditScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void onTapCard(BuildContext context, Document document) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => PreviewScreen(document: document)),
    );
  }
}

class DocumentCard extends StatelessWidget {
  const DocumentCard({
    this.document,
    this.title,
    this.onTap,
  });
  final Document document;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4,
      ),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          height: 80,
          child: Card(
            color: Colors.white,
            elevation: 5,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
