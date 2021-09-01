import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_toybox/screens/mark_down/screen/edit_screen_view_model.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditScreenViewModel(),
      child: EditScreenBody(),
    );
  }
}

class EditScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditScreenViewModel state = context.watch<EditScreenViewModel>();

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
                await state.saveDocument();
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
            title: state.isEditMode
                ? TextField(
                    controller: state.titleController,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white, fontSize: 32),
                    keyboardType: TextInputType.multiline,
                  )
                : FittedBox(child: Text(state.titleController.text)),
            actions: [
              EditActions(
                isEditMode: state.isEditMode,
                onTapEdit: () {
                  FocusManager.instance.primaryFocus.unfocus();
                  state.onEditMode();
                },
                onTapPreview: () {
                  FocusManager.instance.primaryFocus.unfocus();
                  state.onPreviewMode();
                },
              )
            ],
          ),
          body: SafeArea(
            child: RawScrollbar(
              controller: state.scrollControler,
              radius: Radius.circular(20),
              thumbColor: Colors.blue,
              thickness: 5,
              isAlwaysShown: true,
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: state.isEditMode
                      ? TextField(
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          controller: state.bodyController,
                          textInputAction: TextInputAction.newline,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        )
                      : Markdown(
                          controller: state.scrollControler,
                          data: state.bodyController.text),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditActions extends StatelessWidget {
  const EditActions({
    Key key,
    this.isEditMode = true,
    @required this.onTapEdit,
    @required this.onTapPreview,
  }) : super(key: key);

  final bool isEditMode;
  final VoidCallback onTapEdit;
  final VoidCallback onTapPreview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      // decoration: BoxDecoration(
      //     border: Border.all(color: Colors.white),
      //     borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: onTapEdit,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.mode_edit,
                color: isEditMode ? Colors.grey : Colors.white,
              ),
            ),
          ),
          VerticalDivider(
            thickness: 1,
            color: Colors.white,
            indent: 4,
            endIndent: 4,
            width: 5,
          ),
          GestureDetector(
            onTap: onTapPreview,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.visibility,
                color: !isEditMode ? Colors.grey : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
