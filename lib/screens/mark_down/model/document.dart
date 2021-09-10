import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Document {
  Document({
    this.id,
    @required this.title,
    this.content,
  });

  final String id;
  final String title;
  final String content;
}
