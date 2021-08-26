import 'package:flutter/material.dart';
import 'package:flutter_toybox/screens/mark_down/edit_screen.dart';
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
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 4,
              ),
              child: Container(
                height: 80,
                child: Card(
                  color: Colors.white,
                  elevation: 5,
                  child: Text('THIS IS TEST CARD'),
                ),
              ),
            );
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
}
