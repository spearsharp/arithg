import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnimationSwitcher extends StatefulWidget {
  final String title;
  const AnimationSwitcher({super.key, required this.title});

  @override
  State<AnimationSwitcher> createState() => AnimationSwitcherState();
}

class AnimationSwitcherState extends State<AnimationSwitcher> {
  bool flag = true;
  late String gettitle;
  @override
  void initState() {
    super.initState();
    gettitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("animated flutter"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flag = !flag;
          });
          print(flag);
        },
        child: const Icon(
          Icons.opacity,
        ),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: 300,
          height: 180,
          color: Colors.yellow,
          child: gettitle == "title1"
              ? AnimatedSwitcher(
                  transitionBuilder: ((child, animation) {
                    return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ));
                  }),
                  duration: const Duration(milliseconds: 100),
                  child: flag
                      ? const CircularProgressIndicator()
                      : Image.network(
                          "https://www.itying.com/images/flutter/2.png",
                          fit: BoxFit.contain))
              : AnimatedSwitcher(
                  transitionBuilder: ((child, animation) {
                    return ScaleTransition(
                        scale: animation,
                        child: FadeTransition(
                          opacity: animation,
                          child: child,
                        ));
                  }),
                  duration: const Duration(milliseconds: 1000),
                  child: Text(
                    key: UniqueKey(),
                    flag ? "你好flutter" : "你好动态子组件",
                    style: TextStyle(fontSize: 30),
                  )),
        ),
      ),
    );
  }
}
