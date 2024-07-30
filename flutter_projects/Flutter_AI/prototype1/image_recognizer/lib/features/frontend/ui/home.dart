import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double? _deviceHeight, _deviceWidth;
  final ImagePicker _picker = ImagePicker();
  List<String> _images = [];

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _fetchImages();
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: _images.length,
      itemBuilder: (context, int index) {
        return Image.network(_images[index]);
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
      File image = File(result.files.single.path!);
      _uploadImage(image); // Use this method to upload the selected image
    } else {
      // User canceled the picker
      print('No file selected');
    }
  }

  Future<void> _fetchImages() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/images'));
    if (response.statusCode == 200) {
      final List<dynamic> imageList = json.decode(response.body);
      setState(() {
        _images = imageList
            .map<String>((item) => item['filepath'] as String)
            .toList();
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<void> _uploadImage(File image) async {
    final request = http.MultipartRequest(
        'POST', Uri.parse('http://127.0.0.1:5000/upload'));
    request.files.add(await http.MultipartFile.fromPath('image', image.path));
    final response = await request.send();
    if (response.statusCode == 201) {
      _fetchImages();
    } else {
      throw Exception('Failed to upload image');
    }
  }
}
