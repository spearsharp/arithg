import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late int _currentIndex;
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(body: Center(child: const Text("中间中间标题")));
    return const Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _tangle(),
            SizedBox(
              height: 3,
            ),
            _buttonA(),
            SizedBox(
              height: 3,
            ),
            _clipOvalPic(),
            SizedBox(
              height: 3,
            ),
            _iconInstances(),
          ]),
    );
  }
}

class _tangle extends StatelessWidget {
  const _tangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.blue, blurRadius: 20.0)
              ], //边框阴影效果
              gradient: const LinearGradient(
                  colors: [Colors.yellow, Colors.red],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight)),
          transform: Matrix4.rotationZ(0),
          child: Container(
              alignment: Alignment.center,
              // padding: EdgeInsets.all(60.0),
              child: const Text(
                "你好",
                style: TextStyle(fontSize: 20, color: Colors.white),
                // textAlign: TextAlign.center,
              )),
        ));
  }
}

class _buttonA extends StatelessWidget {
  const _buttonA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
            // margin: const EdgeInsets.all(6),
            // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            alignment: Alignment.center,
            width: 100,
            height: 30,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: const Text("确定",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)))));
  }
}

class _clipOvalPic extends StatelessWidget {
  const _clipOvalPic({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.asset(
      "images/portrait.jpg",
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ));
  }
}

class _iconInstances extends StatelessWidget {
  const _iconInstances({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(),
      child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/iconsInstances",
                arguments: {"title": "icons"});
          },
          child: const Text(
            "图标",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
          )),
    );
  }
}
