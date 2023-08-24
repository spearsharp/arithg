import 'package:flutter/material.dart';

import '../../utils/keepAliveWrapper.dart';

class HomeTabpage extends StatefulWidget {
  const HomeTabpage({super.key});

  @override
  State<HomeTabpage> createState() => _HomeTabpageState();
}

class _HomeTabpageState extends State<HomeTabpage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void dispose() {
    //TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("测试"));
  }
}
