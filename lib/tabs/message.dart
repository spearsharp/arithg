import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late int _currentIndex;
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text("message page")));
  }
}
