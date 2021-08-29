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
  @override
  Widget build(BuildContext context) {
    final EditScreenState state = context.watch<EditScreenState>();

    return WillPopScope(
      onWillPop: () {
        FocusManager.instance.primaryFocus.unfocus();
        Navigator.of(context).pop(false);
        return;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus.unfocus(),
        child: Scaffold(
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              FocusManager.instance.primaryFocus.unfocus();
              try {
                await state.setDoucmentData();
                Navigator.of(context).pop();
              } catch (e) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text(e.toString()),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('OK'),
                        )
                      ],
                    );
                  },
                );
              }
            },
            label: Text('SAVE'),
            icon: Icon(Icons.save),
          ),
          appBar: AppBar(
            title: Text('EDIT SCREEN'),
          ),
          body: SafeArea(
            child: RawScrollbar(
              radius: Radius.circular(20),
              thumbColor: Colors.blue,
              thickness: 5,
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
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: state.bodyController,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
