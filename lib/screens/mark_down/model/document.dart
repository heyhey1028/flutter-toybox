import 'package:flutter/material.dart';

class Document {
  Document({
    @required this.title,
    this.content,
  });

  final String title;
  final String content;
}
