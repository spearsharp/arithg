// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class CountView extends StatelessWidget {
  final Map arguments;
  const CountView({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter count page"),
        centerTitle: true,
      ),
      body: const _countPage(),
    );
  }
}

class _countPage extends StatefulWidget {
  const _countPage();

  @override
  State<_countPage> createState() => _countPageState();
}

class _countPageState extends State<_countPage> {
  int countNum = 0;
  List<Widget> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Center(child: Text("$countNum")),
      ElevatedButton(
          onPressed: () {
            setState(() {
              countNum++;
            });
            // countNum++;
            print(countNum);
          },
          child: const Icon(Icons.add_alarm)),
      ElevatedButton(
          onPressed: () {
            setState(() {
              countNum--;
            });
            print(countNum);
          },
          child: const Icon(Icons.minimize_rounded)),
      Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    list.add(const Text("增加一条数据"));
                  });
                  print(list);
                },
                child: const Text("增加")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    list.removeLast();
                  });
                  print(list);
                },
                child: const Text("减少")),
          ]),
          const SizedBox(
            height: 80,
          ),
          Column(children: list),
        ],
      )
    ]));
  }
}
