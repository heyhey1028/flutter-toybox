import 'package:flutter/material.dart';
import 'package:flutter_toybox/screens/mark_down/edit_screen_state.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditScreenState(),
      child: EditScreenBody(),
    );
  }
}

class EditScreenBody extends StatelessWidget {
  const EditScreenBody({this.titleController, this.bodyController});

  final TextEditingController titleController;
  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    final EditScreenState state = context.watch<EditScreenState>();

    return WillPopScope(
      onWillPop: () {
        FocusManager.instance.primaryFocus.unfocus();
        Navigator.of(context).pop(false);
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('EDIT SCREEN'),
        ),
        body: SafeArea(
          child: Scrollbar(
            thickness: 8,
            isAlwaysShown: true,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: state.titleController,
                    ),
                    TextField(
                      maxLines: 100,
                      controller: state.bodyController,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
