import 'package:flutter/material.dart';
import 'main_drawer.dart';

class AppScaffold extends StatelessWidget {
  AppScaffold({
    this.body,
    this.floatingActionButton,
    this.title,
  });

  final Widget body;
  final Widget floatingActionButton;
  final Widget title;
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
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      drawer: MainDrawer(),
      extendBodyBehindAppBar: true,
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
