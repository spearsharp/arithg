import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Search extends StatefulWidget {
  final Map arguments;
  const Search({super.key, required this.arguments});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late Map txt;
  late String searchTxt;
  @override
  void initState() {
    txt = widget.arguments;
    print(txt);
    print(txt["searchtxt"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [],
          title: const Text("Search Page"),
          titleTextStyle: const TextStyle(
              fontSize: 30, color: Color.fromARGB(137, 112, 75, 75))),
      body: Center(child: Text(txt["searchtxt"])),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.home)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
