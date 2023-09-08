import 'package:flutter/material.dart';

class RegisterFirstPage extends StatefulWidget {
  final Map arguments;
  const RegisterFirstPage({super.key, required this.arguments});

  @override
  State<RegisterFirstPage> createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  late Map t;
  late String title;
  @override
  void initState() {
    t = widget.arguments;
    title = t["title"];
    print(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(title),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/registerSecond",
                  arguments: {"title": "第二注册页"});
            },
            child: const Text("跳转第二页")),
      ]),
    ));
  }
}
