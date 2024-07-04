import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {

  int _currentPage = 0;

  final List<Widget> _pages = [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ondulgram",
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.add_a_photo),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(),
      body: _pages[_currentPage],
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentPage,

      onTap: (_index) {
        setState(() {
          _currentPage = _index;
        });
        //print(_int);
      },
      items: const [
        BottomNavigationBarItem(
          label: 'feed',
          icon: Icon(
            Icons.feed,
          ),
        ),

        BottomNavigationBarItem(
          label: 'profile',
          icon: Icon(
            Icons.account_box,
          ),
        ),

      ],
    );
  }
}
