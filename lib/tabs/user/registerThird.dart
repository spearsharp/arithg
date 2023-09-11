import 'package:arithg/utils/tabs.dart';
import 'package:flutter/material.dart';

class RegisterThirdPage extends StatefulWidget {
  final Map arguments;
  const RegisterThirdPage({super.key, required this.arguments});

  @override
  State<RegisterThirdPage> createState() => _RegisterThirdPageState();
}

class _RegisterThirdPageState extends State<RegisterThirdPage> {
  late Map t;
  @override
  void initState() {
    t = widget.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(t["title"]),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("回到上一页")),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
          onPressed: () {
            // Navigator.of(context).pushReplacementNamed("/hometabpage");
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (BuildContext context) {
              return const BottomTabs(index: 4);
            }), (route) => false);
          },
          child: const Text("完成注册")),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed("/");
          },
          child: const Text("回到首页")),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                // 无法返回
                MaterialPageRoute(
                    builder: (BuildContext context) => const BottomTabs()),
                (route) => false);
          },
          child: const Text("回到根路由")),
    ])));
  }
}
