import 'package:flutter/material.dart';

class RegisterSecondPage extends StatefulWidget {
  final Map arguments;
  const RegisterSecondPage({super.key, required this.arguments});

  @override
  State<RegisterSecondPage> createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  late Map t;
  @override
  void initState() {
    t = widget.arguments;
    print(t);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(t["title"]),
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/registerThird",
                arguments: {"title": "第三注册页面"});
          },
          child: const Text("跳转第三注册页"))
    ])));
  }
}
