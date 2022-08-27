import 'package:flutter/material.dart';
import 'main_drawer.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({
    required this.body,
    this.floatingActionButton,
    this.title,
    this.color = Colors.blue,
  });

  final Widget body;
  final Widget? floatingActionButton;
  final Widget? title;
  final MaterialColor color;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: title,
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.menu, size: 40), // change this size and style
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
      ),
      drawer: MainDrawer(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              color[600]!,
              color[400]!,
              color[200]!,
            ],
          ),
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
