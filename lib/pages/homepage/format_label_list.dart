import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

String formatLabelList(
    List<ImageLabel> labeledObjects, List<DetectedObject> detectedObjects) {
  // List<ImageLabel> labeledObjects) {
  String textBody = '\n';

  textBody = textBody + '---image_labeling_results---\n \n';
  if (labeledObjects.isEmpty) {
    textBody = textBody + 'No labels detected \n';
  } else {
    for (ImageLabel object in labeledObjects) {
      var confidence =
          double.parse((object.confidence * 100).toStringAsFixed(1));
      textBody = textBody + '[$confidence%] = ${object.label} \n';
    }
  }

  textBody = textBody + '\n\n---object_detection_results---\n \n';
  if (detectedObjects.isEmpty) {
    textBody = textBody + 'No objects detected \n';
  } else {
    for (DetectedObject object in detectedObjects) {
      var bottom = object.boundingBox.bottom;
      var top = object.boundingBox.top;
      var left = object.boundingBox.left;
      var right = object.boundingBox.right;

      if (object.labels.isEmpty) {
        textBody = textBody + 'No labels detected \n\nBoundries detected\n';
      } else {
        for (Label label in object.labels) {
          var confidence =
              double.parse((label.confidence * 100).toStringAsFixed(1));
          textBody = textBody + '[$confidence%] = ${label.text} \n';
        }
      }

      textBody = textBody + '($bottom, $top. $left, $right)  \n\n';
    }
  }

  return textBody;
}
