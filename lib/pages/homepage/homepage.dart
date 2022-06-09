// ignore_for_file: avoid_print
// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'process_image.dart';

// We create a "provider", which will store a value (here 'Capture an Image').
// By using a provider, this allows us to mock/override the value exposed.
final promptProvider = StateProvider((_) => 'Capture an Image');
final imageSourceProvider = StateProvider((_) => '');
final pathProvider = StateProvider((_) => '');
// TODO: Convert into FutureProvider
final scannedTextProvider = StateProvider((_) => '');

class HomePage extends HookConsumerWidget {
  HomePage({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String prompt = ref.watch(promptProvider);
    String source = ref.watch(imageSourceProvider);
    String path = ref.watch(pathProvider);
    String scannedText = ref.watch(scannedTextProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(source),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (path.isEmpty)
                Text(
                  prompt,
                  style: const TextStyle(fontSize: 25),
                ),
              Column(
                children: [
                  if (path.isNotEmpty)
                    SizedBox(
                      height: 300,
                      width: 600,
                      child: Image.file(File(path)),
                    ),
                  // TODO: Handle scannedText asynchronously + Add progress indicator
                  Text(
                    scannedText,
                    style: const TextStyle(fontSize: 25),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_outlined), label: 'Video'),
        ],
        onTap: (int index) async {
          if (index == 0) {
            // TODO: Find a better way to dispose of state
            ref.read(promptProvider.state).state = 'Capture an Image';
            ref.read(imageSourceProvider.state).state = 'Home';
            ref.read(pathProvider.state).state = '';
            ref.read(scannedTextProvider.state).state = '';
          }
          if (index == 1) {
            void submit() {
              Navigator.of(context).pop(controller.text);
              controller.clear();
            }

            // ? A Test Dialog UI to pass in keyword to video page
            // final keyword = await showDialog<String>(
            //     context: context,
            //     builder: (context) => AlertDialog(
            //           title: const Text('Enter Keyword'),
            //           content: TextField(
            //             autofocus: true,
            //             decoration: const InputDecoration(hintText: ".."),
            //             controller: controller,
            //             onSubmitted: (_) => submit,
            //           ),
            //           actions: [
            //             TextButton(
            //                 onPressed: submit, child: const Text('Submit'))
            //           ],
            //         ));

            // ? Simulating passing data in Navigator arguments
            // TODO: Cleanup and pass keyword when video option is selected
            Navigator.of(context).pushNamed('/video', arguments: 'apple');
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //Init Floating Action Bubble
      floatingActionButton: FloatingActionButton(
        // Menu items
        child: const Icon(Icons.camera),
        onPressed: () async {
          // TODO: Find a better way to dispose of state
          ref.read(promptProvider.state).state = '';
          ref.read(pathProvider.state).state = '';
          ref.read(scannedTextProvider.state).state = '';
          XFile? imageFile;

          // ? Optional: Gallery feature
          // ref.read(imageSourceProvider.state).state = 'gallery';
          // imageFile =
          //     await ImagePicker().pickImage(source: ImageSource.gallery);

          // TODO: Extract functionality into separate class
          ref.read(imageSourceProvider.state).state = 'Camera';
          imageFile = await ImagePicker().pickImage(source: ImageSource.camera);
          ref.read(pathProvider.state).state = imageFile!.path;
          ref.read(scannedTextProvider.state).state =
              await processImage(InputImage.fromFilePath(imageFile.path));
        },
      ),
    );
  }
}
