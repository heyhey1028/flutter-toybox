import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/app_scaffold.dart';

class FaceDetectionScreen extends StatefulWidget {
  const FaceDetectionScreen({super.key});

  @override
  State<FaceDetectionScreen> createState() => _FaceDetectionScreenState();
}

class _FaceDetectionScreenState extends State<FaceDetectionScreen> {
  ui.Image? _image;
  List<Rect> rects = [];
  String text = 'Image not loaded';
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return AppScaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: 'image',
              onPressed: _getImageFromGallery,
              child: const Icon(Icons.image),
            ),
            FloatingActionButton(
              heroTag: 'camera',
              onPressed: _getImageFromCamera,
              child: const Icon(Icons.photo_camera),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: screenSize.height / 1.8,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: _image == null
                        ? Image.asset(
                            'assets/images/nobody.png',
                            fit: BoxFit.cover,
                          )
                        : SizedBox(
                            height: _image!.height.toDouble(),
                            width: _image!.width.toDouble(),
                            child: CustomPaint(
                              painter: Painter(rects, _image),
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: screenSize.height / 6,
                  child: Text(text),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _getImageFromCamera() async {
    // カメラから写真を取得する部分
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    print('camera image: ${pickedFile?.path}');
    if (pickedFile == null) {
      return;
    }
    await _detectFace(File(pickedFile.path));
  }

  Future<void> _getImageFromGallery() async {
    // カメラから写真を取得する部分
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    print('picked image: ${pickedFile?.path}');

    if (pickedFile == null) {
      return;
    }
    await _detectFace(File(pickedFile.path));
  }

  Future<void> _detectFace(File image) async {
    final inputImage = InputImage.fromFile(image);
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);

    final bytesFromImageFile = await image.readAsBytes();
    setState(() {
      decodeImageFromList(bytesFromImageFile).then((img) {
        setState(() {
          _image = img;
        });
      });
    });
    final faces = await faceDetector.processImage(inputImage);
    print('faces: ${faces.length}');
    for (final face in faces) {
      print('face: $face');
      final boundingBox = face.boundingBox;

      final rotX =
          face.headEulerAngleX; // Head is tilted up and down rotX degrees
      final rotY =
          face.headEulerAngleY; // Head is rotated to the right rotY degrees
      final rotZ = face.headEulerAngleZ; // Head is tilted sideways rotZ degrees

      // If landmark detection was enabled with FaceDetectorOptions (mouth, ears,
      // eyes, cheeks, and nose available):
      final leftEar = face.landmarks[FaceLandmarkType.leftEar];
      if (leftEar != null) {
        final leftEarPos = leftEar.position;
      }

      // If classification was enabled with FaceDetectorOptions:
      if (face.smilingProbability != null) {
        final smileProb = face.smilingProbability ?? 0;
      }

      // If face tracking was enabled with FaceDetectorOptions:
      if (face.trackingId != null) {
        final id = face.trackingId ?? 0;
      }
    }
    await faceDetector.close();
  }
}

class Painter extends CustomPainter {
  Painter(this.rects, this.image);

  final List<Rect> rects;
  ui.Image? image;

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) {
      return;
    }
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    if (image != null) {
      canvas.drawImage(image!, Offset.zero, paint);
    }

    for (var i = 0; i <= rects.length - 1; i++) {
      canvas.drawRect(rects[i], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
