import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String testData = '# Hello Markdown\n## Topics3';

    return Scaffold(
      appBar: AppBar(title: Text('Preview')),
      body: FutureBuilder(
        future: rootBundle.loadString("assets/markdowns/hello.md"),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            print('データの中身：${snapshot.data}');
            return Markdown(data: testData);
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
