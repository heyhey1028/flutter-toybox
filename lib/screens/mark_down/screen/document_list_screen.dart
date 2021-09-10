import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toybox/screens/mark_down/repository/document_repository.dart';
import 'package:flutter_toybox/screens/mark_down/screen/edit_screen.dart';
import 'package:flutter_toybox/screens/mark_down/model/document.dart';
import 'package:flutter_toybox/widgets/app_scaffold.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.indigo[600],
              Colors.indigo[400],
              Colors.indigo[200],
            ],
          ),
        ),
        child: StreamBuilder<List<Document>>(
          stream: DocumentRepositoryImpl().getDocuments(),
          builder: (context, AsyncSnapshot<List<Document>> snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: snapshots.data.length,
                itemBuilder: (context, index) {
                  return DocumentCard(
                    title: snapshots.data[index].id,
                    onTap: () => onTapCard(context, snapshots.data[index]),
                  );
                },
              );
            }

            if (snapshots.hasError) {
              return Text(snapshots.error.toString());
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
      MaterialPageRoute(builder: (_) => EditScreen(document: document)),
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60.0),
        ),
        color: Colors.white,
        elevation: 5,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            height: 80,
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
