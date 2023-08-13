import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage extends StatefulWidget {
  const Storage({super.key});

  @override
  State<Storage> createState() => _storageState();
}

class _storageState extends State<Storage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  _saveData() async {
    final prefs = await _prefs;
    prefs.setString("score:", "zhangsan");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
