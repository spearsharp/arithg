import 'dart:async';

import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  final Map arguments;

  const HeroPage({super.key, required this.arguments});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  // @override
  // void initState() {
  //   print(argument);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.arguments["imageUrl"],
                  child: Image.network(widget.arguments["imageUrl"]),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    // widget.arguments["description"],
                    "test",
                    style: TextStyle(fontSize: 22),
                  ),
                )
              ],
            )));
  }
}
