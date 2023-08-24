import 'package:arithg/test.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

// ignore: non_constant_identifier_name
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("flutter app"),
          titleTextStyle:
              const TextStyle(color: Color.fromARGB(255, 206, 29, 74))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _list.add("i'm is a linear widget");
          });
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: _list.map((v) {
          return ListTile(
              title: Text(v),
              titleTextStyle: const TextStyle(color: Colors.black));
        }).toList(),
      ),
    );
  }
}
