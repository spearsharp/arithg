import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeyPage extends StatefulWidget {
  final Map arguments;
  KeyPage({super.key, required this.arguments});

  @override
  State<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  //Global key optimized
  List<Widget> list = [];
  final GlobalKey _key1 = GlobalKey();
  final GlobalKey _key2 = GlobalKey();
  final GlobalKey _key3 = GlobalKey();

  @override
  void initState() {
    //TODO:  implement initState
    super.initState();
    list = [
      _Box(key: _key1, color: Colors.amber),
      _Box(key: _key2, color: Colors.red),
      _Box(key: _key3, color: Colors.blue),
    ];
  }

  //Private Key
  // List<Widget> list = [
  //   _Box(key: const ValueKey(1), color: Colors.amber),
  //   _Box(key: ObjectKey(_Box(color: Colors.red)), color: Colors.red),
  //   _Box(key: UniqueKey(), color: Colors.blue),
  // ];
  @override
  Widget build(BuildContext context) {
    print("media screen:");
    print(MediaQuery.of(context).orientation);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              list.shuffle();
            });
          },
          child: const Icon(Icons.refresh)),
      appBar: AppBar(
        title: const Text("Keypage"),
        centerTitle: true,
      ),
      body: Center(
        child: MediaQuery.of(context).orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: list,
              ),
      ),
    );
  }
}

class _Box extends StatefulWidget {
  Color color;
  _Box({Key? key, required this.color}) : super(key: key);

  @override
  State<_Box> createState() => __BoxState();
}

class __BoxState extends State<_Box> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(widget.color)),
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            child: Text(
              "$_count",
            )));
  }
}
