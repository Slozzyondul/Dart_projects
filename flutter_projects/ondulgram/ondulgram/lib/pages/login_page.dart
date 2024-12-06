import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ondulgram/services/firebase_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  double? _deviceHeight, _deviceWidth;

  FirebaseService? _firebaseService;

  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

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
                _loginForm(),
                _loginButton(),
                _registerPageLink(),
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
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      height: _deviceHeight! * 0.2,
      child: Form(
        key: _loginFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(
      onPressed: _loginUser,
      minWidth: _deviceWidth! * 0.7,
      height: _deviceHeight! * 0.06,
      color: Colors.black,
      child: const Text(
        "login",
        style: TextStyle(
          color: Colors.yellow,
          fontSize: 25,
          fontWeight: FontWeight.w600,
        ),
      ),
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

  Widget _registerPageLink() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'register'),
      child: const Text(
        'dont have an account?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  void _loginUser() async {
    //print(_loginFormKey.currentState!.validate());
    if (_loginFormKey.currentState!.validate()) {
      _loginFormKey.currentState!
          .save(); // this will save the current information in the form
      bool _result = await _firebaseService!
          .loginUser(email: _email!, password: _password!);
      if (_result) Navigator.popAndPushNamed(context, 'home');
      
    }
  }
}
