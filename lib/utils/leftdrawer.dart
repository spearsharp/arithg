import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer(Set set, {super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: Drawer(
          child: Column(children: [
        SizedBox(height: 20),
        ListTile(
            leading: CircleAvatar(child: Icon(Icons.people)),
            title: Text("个人中心")),
        ListTile(
            leading: CircleAvatar(child: Icon(Icons.bolt)), title: Text("中心"))
      ])),
    );
  }
}
