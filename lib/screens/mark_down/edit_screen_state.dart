import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditScreenState extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  ScrollController scrollControler = ScrollController();
  bool isEditMode = true;
  bool get isPreviewMode => !isEditMode;

  Future<void> setDoucmentData() async {
    final Map<String, dynamic> data = {
      "title": titleController.text,
      "content": bodyController.text,
    };

    await FirebaseFirestore.instance.collection('documents').doc().set(data);
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
