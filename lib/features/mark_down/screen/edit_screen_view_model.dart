import 'package:flutter/cupertino.dart';
import 'package:flutter_toybox/features/mark_down/model/document.dart';
import 'package:flutter_toybox/features/mark_down/repository/document_repository.dart';

class EditScreenViewModel extends ChangeNotifier {
  late Document currentDocument;
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  ScrollController scrollControler = ScrollController(initialScrollOffset: 0);
  bool isEditMode = true;
  bool get isPreviewMode => !isEditMode;

  Future<void> saveDocument() async {
    final Document saveDoc = Document(
        id: currentDocument.id,
        title: titleController.text,
        content: bodyController.text);
    await DocumentRepositoryImpl().setDocumentData(saveDoc);
  }

  void initializeWithDocument(Document document) {
    currentDocument = document;
    titleController.text = document.title;
    bodyController.text = document.content;
    onPreviewMode();
    notifyListeners();
  }

  void onEditMode() {
    isEditMode = true;
    notifyListeners();
  }

  void onPreviewMode() {
    isEditMode = false;
    notifyListeners();
  }

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    scrollControler.dispose();
    super.dispose();
  }
}
