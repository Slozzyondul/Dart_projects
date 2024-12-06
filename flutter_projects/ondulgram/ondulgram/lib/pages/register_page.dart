import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ondulgram/services/firebase_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  double? _deviceHeight, _deviceWidth;

  FirebaseService? _firebaseService;

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();

  String? _name, _email, _password;
  File? _image;

  @override
  void initState() {
    super.initState();
    _firebaseService = GetIt.instance.get<FirebaseService>();
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth! * 0.05,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _titleWidget(),
                _profileImageWidget(),
                _registrationForm(),
                _registerButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleWidget() {
    return const Text(
      "ondulgram",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _registrationForm() {
    return SizedBox(
      height: _deviceHeight! * 0.30,
      child: Form(
        key: _registerFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _nameTextField(),
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _profileImageWidget() {
    ImageProvider _imageProvider = _image != null
        ? FileImage(_image!)
        : const NetworkImage("https://i.pravatar.cc/300");
    
    return GestureDetector(
      onTap: () async {
        var result = await FilePicker.platform.pickFiles(type: FileType.image);
        if (result != null && result.files.first.path != null) {
          setState(() {
            _image = File(result.files.first.path!);
          });
        }
      },
      child: Container(
        width: _deviceWidth! * 0.30,
        height: _deviceHeight! * 0.30,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: _imageProvider,
          ),
        ),
      ),
    );
  }

  Widget _nameTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "name..."),
      validator: (_value) => _value!.isNotEmpty ? null : "please enter a name",
      onSaved: (_value) {
        setState(
          () {
            _name = _value;
          },
        );
      },
    );
  }

  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "email..."),
      onSaved: (_value) {
        setState(
          () {
            _email = _value;
          },
        );
      },
      validator: (_value) {
        bool _result = _value!.contains(
          RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"),
        );
        return _result ? null : "please use a valid email";
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "password..."),
      onSaved: (_value) {
        setState(
          () {
            _password = _value;
          },
        );
      },
      validator: (_value) =>
          _value!.length > 6 ? null : "password must be at least 6 characters",
    );
  }

  Widget _registerButton() {
    return MaterialButton(
      onPressed: _registerUser,
      minWidth: _deviceWidth! * 0.50,
      height: _deviceHeight! * 0.05,
      color: Colors.black,
      child: const Text(
        "register",
        style: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.w400,
          fontSize: 20,
        ),
      ),
    );
  }

  void _registerUser() async {
    if (_registerFormKey.currentState!.validate() && _image != null) {
      _registerFormKey.currentState!.save();
      bool _result = await _firebaseService!.registerUser(
        name: _name!,
        email: _email!,
        password: _password!,
        image: _image!.path,
      );
      if (_result) Navigator.pop(context);
    }
  }
}
