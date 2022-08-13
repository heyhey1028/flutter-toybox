import 'package:flutter/material.dart';

class Document {
  Document({
    required this.id,
    required this.title,
    required this.content,
  });

  final String id;
  final String title;
  final String content;
}
