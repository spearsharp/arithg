import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({Key? key}) : super(key: key);

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  // late AnimationController _animationPageController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync:
            this, //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保持同步，以达到供需平衡的效果，防止卡顿现象。
        duration: const Duration(seconds: 1),
        lowerBound: 0, //第三圈转到第五圈
        upperBound: 0.2)
      ..repeat(reverse: true);
    _animationController.addListener(() {
      print(_animationController.value);
    });
    // _animationPageController = AnimationController(
    //     vsync:
    //         this, //Vsync 机制可以理解为是显卡与显示器的通信桥梁，显卡在渲染每一帧之前会等待垂直同步信号，只有显示器完成了一次刷新时，发出垂直同步信号，显卡才会渲染下一帧，确保刷新率和帧率保持同步，以达到供需平衡的效果，防止卡顿现象。
    //     duration: const Duration(seconds: 1),
    //     lowerBound: 3, //第三圈转到第五圈
    //     upperBound: 5);
    // _animationPageController.addListener(() {
    //   print(_animationPageController.value);
    // });
  }

  @override
  void dispose() {
    _animationController.dispose();
    // _animationPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("旋转动画"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RotationTransition(
              turns: _animationController,
              child: const FlutterLogo(
                size: 60,
              )),
          const SizedBox(
            height: 30,
          ),
          // FadeTransition(
          //     opacity: _animationPageController,
          //     child: const FlutterLogo(
          //       size: 60.0,
          //     )),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _animationController.forward();
                      // _animationPageController.forward();
                    },
                    child: const Text("Forward")),
                ElevatedButton(
                    onPressed: () {
                      _animationController.reverse();
                      // _animationPageController.reverse();
                    },
                    child: const Text("Reverse")),
                ElevatedButton(
                    onPressed: () {
                      _animationController.stop();
                      // _animationPageController.stop();
                    },
                    child: const Text("stop")),
                ElevatedButton(
                    onPressed: () {
                      _animationController.reset();
                      // _animationPageController.reset();
                    },
                    child: const Text("reset")),
                ElevatedButton(
                    onPressed: () {
                      _animationController.repeat();
                      // _animationPageController.repeat();
                    },
                    child: const Text("repeat")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
