import 'package:flutter/cupertino.dart';
import 'package:flutter_toybox/screens/mark_down/model/document.dart';
import 'package:flutter_toybox/screens/mark_down/repository/document_repository.dart';

class EditScreenViewModel extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  ScrollController scrollControler = ScrollController();
  bool isEditMode = true;
  bool get isPreviewMode => !isEditMode;

  Future<void> saveDocument() async {
    final Document saveDoc =
        Document(title: titleController.text, content: bodyController.text);
    await DocumentRepository().setDoucmentData(saveDoc);
  }

  void onEditMode() {
    isEditMode = true;
    notifyListeners();
  }

  void onPreviewMode() {
    isEditMode = false;
    notifyListeners();
  }
}
