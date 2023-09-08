import 'package:flutter/material.dart';
import '../utils/tabs.dart';
import '../pages/form.dart';
import '../pages/searchPage.dart';
import '../pages/news.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var num = "1";
  String title = "test";
  String subtitle = "test subtitle";
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Setting page"));
  }
}
