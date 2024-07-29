import 'package:flutter/material.dart';
import 'package:image_recognizer/features/uploads/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [],
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children: [_searchPageButton()],
        ),
      ),
    );
  }

  Widget _searchPageButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UploadImageScreen(),
          ),
        );
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
      ),
    );
  }
}
