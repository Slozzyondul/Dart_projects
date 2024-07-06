import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ondulgram/services/firebase_service.dart';

class FeedPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FeedPageState();
  }
}

class _FeedPageState extends State<FeedPage> {
  FirebaseService? _firebaseService;
  double? _deviceHeight, _deviceWidth;

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: _deviceHeight!,
      width: _deviceWidth!,
      child: _postsListView(),
    );
  }

  Widget _postsListView() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firebaseService!.getLatestPosts(),
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.hasData) {
          List<DocumentSnapshot> documents = _snapshot.data!.docs;

          List<Map<String, dynamic>> _posts = documents.map((doc) {
            return doc.data() as Map<String, dynamic>;
          }).toList();

          //print(_posts);

          return ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (BuildContext context, int index) {
              Map _post = _posts[index];
              return Container(
                height: _deviceHeight! * 0.30,
                margin: EdgeInsets.symmetric(
                  vertical: _deviceHeight! * 0.01,
                  horizontal: _deviceWidth!* 0.05,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_post['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
