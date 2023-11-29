import 'package:flutter/material.dart';

/*
AnimationController 用于控制动画，它包含动画的启动 forward() 、停止 stop() 、反向播放
reverse() 等方法。 AnimationController 会在动画的每一帧，就会生成一个新的值。默认情况
下， AnimationController 在给定的时间段内线性的生成从 0.0 到1.0（默认区间）的数字 ，我们也
可以通过 lowerbound 和 upperBound 来修改 AnimationController 生成数字的区间。
*/
class AnimationCtrlPage extends StatefulWidget {
  const AnimationCtrlPage({Key? key}) : super(key: key);

  @override
  State<AnimationCtrlPage> createState() => _AnimationCtrlPageState();
}

class _AnimationCtrlPageState extends State<AnimationCtrlPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  get onPressed => null;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Animated Control Page"),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              ScaleTransition(
                scale:
                    _animationController.drive(CurveTween(curve: Curves.ease)),
                child: const FlutterLogo(
                  size: 80,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  onPressed: () {
                    _animationController.forward();
                  },
                  child: const Icon(Icons.abc)),
              ElevatedButton(
                  onPressed: () {
                    _animationController.reverse();
                  },
                  child: const Icon(Icons.abc)),
              ElevatedButton(
                  onPressed: () {
                    _animationController.repeat();
                  },
                  child: const Icon(Icons.abc)),
            ],
          ),
        ));
  }
}
