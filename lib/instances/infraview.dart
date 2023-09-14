import 'package:flutter/material.dart';

class InfraViewPage extends StatefulWidget {
  final Map arguments;
  const InfraViewPage({Key? key, required this.arguments});

  @override
  State<InfraViewPage> createState() => _InfraViewPageState();
}

class _InfraViewPageState extends State<InfraViewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: const Text("布局样例页面"));
  }
}
