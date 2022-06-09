import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'format_label_list.dart';

Future processImage(InputImage inputImage) async {
  final imageLabeler =
      ImageLabeler(options: ImageLabelerOptions(confidenceThreshold: 0.6));

  final objectDetector = ObjectDetector(
      options: ObjectDetectorOptions(
          mode: DetectionMode.singleImage,
          classifyObjects: true,
          multipleObjects: true));

  List<ImageLabel> labeledObjects = await imageLabeler.processImage(inputImage);
  await imageLabeler.close();

  List<DetectedObject> detectedObjects =
      await objectDetector.processImage(inputImage);
  await objectDetector.close();

  return formatLabelList(labeledObjects, detectedObjects);
}
