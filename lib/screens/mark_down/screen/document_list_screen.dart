import 'package:flutter/material.dart';

import '../../../widgets/app_scaffold.dart';
import '../model/document.dart';
import '../repository/document_repository.dart';
import 'edit_screen.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: Text(
        'Markdown Blogs',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.indigo[600]!,
              Colors.indigo[400]!,
              Colors.indigo[200]!,
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
                itemCount: snapshots.data!.length,
                itemBuilder: (context, index) {
                  return DocumentCard(
                    document: snapshots.data![index],
                    title: snapshots.data![index].title,
                    onTap: () => onTapCard(context, snapshots.data![index]),
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
    required this.document,
    required this.title,
    required this.onTap,
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
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.white,
        elevation: 5,
        child: InkWell(
          onTap: () => onTap(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  document.content ?? '',
                  softWrap: true,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[600]!),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
