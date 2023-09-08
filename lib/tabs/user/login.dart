import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Map arguments;
  LoginPage({super.key, required this.arguments});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Map t;
  @override
  void initState() {
    t = widget.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text(t["title"])])));
  }
}
