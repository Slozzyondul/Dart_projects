import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? _deviceHeight, _deviceWidth;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 193, 193),
      appBar: AppBar(
        actions: [
          GestureDetector(
            onTap: _postImage,
            child: Icon(Icons.add_a_photo_outlined),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 16.0,
            ),
          ),
        ],
        title: Center(
          child: Text(
            'Image Searcher',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _imageGridView()), // Wrap GridView with Expanded
        ],
      ),
    );
  }

  Widget _imageGridView() {
    List<String> images = [
      'assets/image1.jpeg',
      'assets/image2.jpg',
      'assets/image3.jpg',
      'assets/image4.jpg',
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(images[index]),
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
        );
      },
    );
  }

  Future<void> _requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Permissions granted
    } else {
      // Permissions not granted, show a message to the user.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permission denied to access storage.')),
      );
    }
  }

  Future<void> _postImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      File image = File(result.files.first.path!);
      // Your code to handle the selected image file.
    } else {
      // User canceled the picker
    }
  }
}
