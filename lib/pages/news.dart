import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  final Map arguments;
  const NewsPage({super.key, required this.arguments});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    print("News Page done");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [],
          title: const Text("News Page"),
          titleTextStyle: const TextStyle(
              fontSize: 30, color: Color.fromARGB(137, 112, 75, 75))),
      body: const Center(child: Text("新闻")),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.home)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
