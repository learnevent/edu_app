import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  XFile? imageFile;

  String scannedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Learn Event"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (imageFile == null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Select Option',
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              if (imageFile != null)
                SizedBox(
                  height: 300,
                  width: 600,
                  child: Image.file(File(imageFile!.path)),
                ),
              Text(
                scannedText,
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'gallery'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'camera'),
        ],
        onTap: _changeIndex,
        currentIndex: _currentIndex,
      ),
    );
  }

  void _changeIndex(int value) {
    _currentIndex = value;
    scannedText = "";
    setState(() {});

    if (_currentIndex == 0) {
      processImage(ImageSource.gallery);
    }

    if (_currentIndex == 1) {
      processImage(ImageSource.camera);
    }
  }

  void processImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    try {
      if (pickedImage != null) {
        imageFile = pickedImage;
        setState(() {});

        final inputImage = InputImage.fromFilePath(pickedImage.path);

        final imageLabeler = ImageLabeler(
            options: ImageLabelerOptions(confidenceThreshold: 0.5));

        List<ImageLabel> labeledObjects =
            await imageLabeler.processImage(inputImage);
        await imageLabeler.close();

        final objectDetector = ObjectDetector(
            options: ObjectDetectorOptions(
                mode: DetectionMode.singleImage,
                classifyObjects: false,
                multipleObjects: false));

        List<DetectedObject> detectedObjects =
            await objectDetector.processImage(inputImage);
        await objectDetector.close();

        scannedText = formatLabelsList(labeledObjects, detectedObjects);
        setState(() {});
      }
    } catch (e) {
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  String formatLabelsList(labeledObjects, detectedObjects) {
    String textBody = '\n';

    for (ImageLabel object in labeledObjects) {
      var confidence =
          double.parse((object.confidence * 100).toStringAsFixed(1));
      textBody = textBody + '[$confidence%] = ${object.label} \n';
    }

    for (DetectedObject object in detectedObjects) {
      var bottom = object.boundingBox.bottom;
      var top = object.boundingBox.top;
      var left = object.boundingBox.left;
      var right = object.boundingBox.right;

      textBody =
          textBody + '\nBoundingBox \n  ($bottom, $top. $left, $right)  \n';
    }
    return textBody;
  }

  @override
  void initState() {
    super.initState();
  }
}
