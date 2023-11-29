import 'dart:ffi';

import 'package:flutter/material.dart';

class AnimatedSlidePage extends StatefulWidget {
  const AnimatedSlidePage({Key? key}) : super(key: key);

  @override
  State<AnimatedSlidePage> createState() => _AnimatedSlidePageState();
}

class _AnimatedSlidePageState extends State<AnimatedSlidePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedSlideController;
  @override
  void initState() {
    super.initState(); // heritage parents charactor
    _animatedSlideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animatedSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenWidth = queryData.size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Slide Page"),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          SlideTransition(
            position: _animatedSlideController.drive(Tween(
                begin: const Offset(0, 0),
                end: const Offset(0.5, 0))), // //表示实际的位置向右移动屏幕宽度的0.5倍
            // position:
            //     Tween(begin: const Offset(0, 0), end: const Offset(0.5, 0))
            //         .chain(CurveTween(curve: Curves.bounceIn))
            //         .chain(CurveTween(
            //             curve: const Interval(0.8, 1.0))) //最后被分枝20的时间完成动画,延时执行
            //         .animate(_animatedSlideController),
            child: const FlutterLogo(size: 80),
          ),
          const SizedBox(
            height: 80,
          ),
          ElevatedButton(
              onPressed: () {
                _animatedSlideController.forward();
                print(screenWidth);
              },
              child: const Text("forward")),
          ElevatedButton(
              onPressed: () {
                _animatedSlideController.reverse();
              },
              child: const Text("reverse"))
        ],
      )),
    );
  }
}
