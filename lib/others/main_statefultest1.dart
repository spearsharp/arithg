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

// ignore: camel_case_types
class _HomePageState extends State<HomePage> {
  int _num = 0;
  @override
  Widget build(BuildContext context) {
    print(_num);
    return Scaffold(
      appBar: AppBar(title: const Text("flutter App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$_num", style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 60),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _num++;
                  });
                },
                child: const Text("add"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _num++;
            });
          },
          child: const Icon(Icons.add)),
    );
  }
}
