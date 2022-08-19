import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_toybox/features/mark_down/model/document.dart';
import 'package:flutter_toybox/features/mark_down/screen/edit_screen_view_model.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  EditScreen({required this.document});

  final Document? document;

  @override
  Widget build(BuildContext context) {
    if (document != null) {
      return ChangeNotifierProvider(
        create: (_) => EditScreenViewModel()..initializeWithDocument(document!),
        child: EditScreenBody(),
      );
    } else {
      return ChangeNotifierProvider(
        create: (_) => EditScreenViewModel(),
        child: EditScreenBody(),
      );
    }
  }
}

class EditScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EditScreenViewModel state = context.watch<EditScreenViewModel>();

    return WillPopScope(
      onWillPop: () async {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.of(context).pop(false);
        return false;
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          floatingActionButton: state.isEditMode
              ? SaveButton(onPressed: () async {
                  await state.saveDocument();
                })
              : null,
          appBar: AppBar(
            title: state.isEditMode
                ? AppBarTextField(titleController: state.titleController)
                : FittedBox(child: Text(state.titleController.text)),
            actions: [
              EditActions(
                isEditMode: state.isEditMode,
                onTapEdit: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  state.onEditMode();
                },
                onTapPreview: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  state.onPreviewMode();
                },
              )
            ],
          ),
          body: SafeArea(
            child: Stack(
              children: [
                RawScrollbar(
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
                          ? ContentTextField(
                              bodyController: state.bodyController)
                          : Markdown(
                              controller: state.scrollControler,
                              data: state.bodyController.text,
                            ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: IconButtonsContainer(
                    textController: state.bodyController,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class IconButtonsContainer extends StatelessWidget {
  const IconButtonsContainer({super.key, required this.textController});
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 80),
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        // border: Border.all(
        //   color: Colors.black,
        // ),
      ),
      child: ListView(
        padding: EdgeInsets.all(4),
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        children: [
          IconButton(
            icon: Icon(Icons.title),
            onPressed: () => addEffectStart('# '),
          ),
          IconButton(
            icon: Icon(Icons.format_bold),
            onPressed: () => addEffectStartAndEnd('*'),
          ),
          IconButton(
            icon: Icon(Icons.format_underline),
            onPressed: () => addEffectStartAndEnd('_'),
          ),
          IconButton(
            icon: Icon(Icons.format_italic),
            onPressed: () => addEffectStartAndEnd('_'),
          ),
          IconButton(
            icon: Icon(Icons.format_quote),
            onPressed: () => addEffectStart('> '),
          ),
          IconButton(
            icon: Icon(Icons.format_list_bulleted),
            onPressed: () => addEffectStart('- '),
          ),
          IconButton(
            icon: Icon(Icons.format_list_numbered),
            onPressed: () => addEffectStart('1. '),
          ),
          IconButton(
            icon: Icon(Icons.check_box_outline_blank),
            onPressed: () => addEffectStart('- [ ] '),
          ),
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => addEffectStartAndEnd('`'),
          ),
          IconButton(
            icon: Icon(Icons.link),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.insert_photo),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.table_chart),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.format_indent_increase),
            onPressed: null,
          ),
          SizedBox(width: 60)
        ],
      ),
    );
  }

  void addEffectStart(String replacement) {
    final int startOffset = textController.selection.start;
    textController.text =
        textController.text.replaceRange(startOffset, startOffset, replacement);
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: startOffset + replacement.length));
  }

  void addEffectStartAndEnd(String mark) {
    final int startOffset = textController.selection.start;
    final int endOffset = textController.selection.end;
    final String selectedText =
        textController.selection.textInside(textController.text);
    final String replaceText = mark + selectedText + mark;
    textController.text =
        textController.text.replaceRange(startOffset, endOffset, replaceText);
    textController.selection = TextSelection.fromPosition(
        TextPosition(offset: startOffset + replaceText.length));
  }
}

class EditActions extends StatelessWidget {
  const EditActions({
    super.key,
    this.isEditMode = true,
    required this.onTapEdit,
    required this.onTapPreview,
  });

  final bool isEditMode;
  final VoidCallback onTapEdit;
  final VoidCallback onTapPreview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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

class AppBarTextField extends StatelessWidget {
  const AppBarTextField({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      controller: titleController,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white, fontSize: 32),
      keyboardType: TextInputType.multiline,
    );
  }
}

class ContentTextField extends StatelessWidget {
  const ContentTextField({
    super.key,
    required this.bodyController,
  });

  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 20),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      controller: bodyController,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        border: InputBorder.none,
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 56),
      child: FloatingActionButton.extended(
        onPressed: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          try {
            onPressed();
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
    );
  }
}
