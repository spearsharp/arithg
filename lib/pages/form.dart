import 'package:flutter/material.dart';

//other pages route into here.
class FormPage extends StatefulWidget {
  final Map arguments;
  const FormPage({super.key, required this.arguments});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  void initState() {
    super.initState();
    print(widget.arguments);
  }

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [],
          title: const Text("Form Page"),
          titleTextStyle: const TextStyle(
              fontSize: 30, color: Color.fromARGB(137, 112, 75, 75))),
      body: const Center(child: Text("表单")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.home)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
