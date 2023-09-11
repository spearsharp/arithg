// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  final String title, subtitle;
  final String num;
  const SearchPage(
      {super.key,
      required this.title,
      required this.num,
      required this.subtitle});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: const [],
          title: Text(widget.subtitle),
          titleTextStyle: const TextStyle(
              fontSize: 28, fontStyle: FontStyle.italic, color: Colors.orange),
        ),
        body: Center(
            child: ListView(children: [
          const ListTile(title: Text("message page")),
          ListTile(title: Text(widget.title)),
          ListTile(title: Text(widget.num as String))
        ])));
  }
}
