import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_toybox/screens/mark_down/model/document.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({
    Key key,
    @required this.document,
  }) : super(key: key);

  final Document document;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(document.title)),
      body: FutureBuilder(
        future: rootBundle.loadString("assets/markdowns/hello.md"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print('データの中身：${snapshot.data}');
            return Markdown(data: document.content);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
