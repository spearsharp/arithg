import 'dart:async';

import 'package:flutter/material.dart';

//other pages route into here.
class FormPage extends StatefulWidget {
  final Map arguments;
  const FormPage({super.key, required this.arguments});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _arrowShootingAnimationController;
  late bool flag;
  _clicktoMove() {
    _arrowShootingAnimationController.forward();
    // Timer.periodic(Duration(milliseconds: 500), (timer) {
    //   print("");
    // });
    // SetState() {
    //   flag = !flag;
    // }
  }

  @override
  void initState() {
    super.initState();
    flag = false;
    _arrowShootingAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    print(widget.arguments);
  }

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [],
          title: const Text("Form Page"),
          titleTextStyle: const TextStyle(
              fontSize: 30, color: Color.fromARGB(137, 112, 75, 75))),
      body: Center(
          // child: AnimatedBuilder(
          //     animation: _arrowShootingAnimationController,
          //     builder: (context, child) {
          child: SlideTransition(
              position: _arrowShootingAnimationController
                  .drive(CurveTween(curve: Curves.elasticInOut))
                  .drive(Tween(begin: Offset(0.0, -10), end: Offset(1, 10))
                      .chain(CurveTween(curve: const Interval(0, 0.8)))),
              child: Container(
                  width: 70,
                  height: 30,
                  child: FadeTransition(
                    opacity: _arrowShootingAnimationController.drive(Tween(
                            begin: 1.0, end: 0.0)
                        .chain(CurveTween(curve: const Interval(0.9, 1.3)))),
                    child: const Text("测试移动"),
                  )))),
      // })),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _clicktoMove();
          },
          // onPressed: () {
          //   Navigator.pop(context);
          // },
          child: const Icon(Icons.home)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
