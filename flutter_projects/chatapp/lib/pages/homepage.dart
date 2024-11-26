import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  double? deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Center(
            child: Text(
              "Chat App",
              style: TextStyle(color: Colors.black38),
            ),
          ),
        ),
        body: Column(
          children: [
            circularWaves(),
            SizedBox(height: deviceHeight! * 0.05),
            bottomButtons(),
          ],
        ),
      ),
    );
  }

  Widget circularWaves() {
    return Container(
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(color: Colors.green, width: deviceWidth! * 0.20),
        ),
      ),
    );
  }

  Widget bottomButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        bottomButtonsText(),
        SizedBox(height: deviceHeight! * 0.05),
        bottomButtonsGetStarted(),
        SizedBox(height: deviceHeight! * 0.05),
        bottomButtonsVideoChat(),
      ],
    );
  }

  Widget bottomButtonsText() {
    return Text(
      "Meet new people connect with them anonymously",
      style: TextStyle(
          color: Colors.black,
          fontSize: deviceWidth! * 0.1,
          fontWeight: FontWeight.bold),
    );
  }

  Widget bottomButtonsGetStarted() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.red, // foreground
      ),
      onPressed: () {},
      child: Text('Get Started'),
    );
  }

  Widget bottomButtonsVideoChat() {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Video Chat"),
    );
  }
}
