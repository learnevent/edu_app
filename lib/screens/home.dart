import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:edu_app/utlis/pick_image.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Upload an Image'),
          children: <Widget>[
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text('Choose from Gallery'),
              onPressed: () async {
                Navigator.of(context).pop();
                pickImage(ImageSource.gallery);
                // Uint8List file = await _pickImage(ImageSource.gallery);
                // setState(() {
                //   _file = file;
                // });
              },
            ),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          iconSize: 100,
          icon: const Icon(Icons.upload_file, color: Colors.blue),
          onPressed: () => _selectImage(context),
        ),
      ),
    );
  }
}
