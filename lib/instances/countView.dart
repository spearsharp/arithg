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
        const _listAdd() // refer to pdf3.1 page205
      ]),
    );
  }
}

class _listAdd extends StatefulWidget {
  const _listAdd();

  @override
  State<_listAdd> createState() => __listAddState();
}

class __listAddState extends State<_listAdd> {
  List<Widget> list = [];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
          children: list.map((value) {
        return ListTile(
          title: Text(value as String),
        );
      }).toList()),
      Padding(
          padding: const EdgeInsets.all(40),
          child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  list.add("增加一条" as Widget);
                });
                print(list);
              },
              icon: Icon(Icons.add_box_sharp),
              label: Text("添加行")))
    ]);
  }
}
