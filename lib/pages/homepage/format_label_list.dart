import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
// import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';

String formatLabelList(
    // List<ImageLabel> labeledObjects, List<DetectedObject> detectedObjects) {
    List<ImageLabel> labeledObjects) {
  String textBody = '\n';

  for (ImageLabel object in labeledObjects) {
    var confidence = double.parse((object.confidence * 100).toStringAsFixed(1));
    textBody = textBody + '[$confidence%] = ${object.label} \n';
  }

  // for (DetectedObject object in detectedObjects) {
  //   var bottom = object.boundingBox.bottom;
  //   var top = object.boundingBox.top;
  //   var left = object.boundingBox.left;
  //   var right = object.boundingBox.right;

  //   textBody =
  //       textBody + '\nBoundingBox \n  ($bottom, $top. $left, $right)  \n';
  // }
  return textBody;
}
