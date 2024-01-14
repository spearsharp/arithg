import 'package:flutter/material.dart';
import '../../utils/keepAliveWrapper.dart';
import '../tabs/home/homeTabPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void dispose() {
    //TODO: implement dispose, close tabcontroller,
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
    return Scaffold(
      appBar: PreferredSize(
          // page 140
          preferredSize: Size.fromHeight(30.0),
          child: AppBar(
              backgroundColor: Color.fromARGB(255, 253, 247, 247),
              elevation: 0.1,
              title: SizedBox(
                  height: 30,
                  child: TabBar(
                    isScrollable: true,
                    indicatorColor: Colors.red,
                    labelColor: Colors.red,
                    unselectedLabelColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabAlignment: TabAlignment.start,
                    controller:
                        _tabController, // controller must be in one page
                    tabs: const [
                      Tab(
                          child: Text("热门",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("推荐",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("视频",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("体育",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("美术",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("文娱",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("嘉嘉",
                              style: TextStyle(color: Colors.black))),
                      Tab(
                          child: Text("汽车",
                              style: TextStyle(color: Colors.black))),
                    ],
                  )))),
      body: TabBarView(controller: _tabController, children: [
        const KeepAliveWrapper(child: HomeTabpage()), // HomeTabPage single page
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("视频tab1")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab4")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab7")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab8")),
          ],
        )),
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab0")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab1")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab4")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab"))
          ],
        )),
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("视频tab1")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab4")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab7")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab8")),
          ],
        )),
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab0")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab1")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab4")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab"))
          ],
        )),
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("视频tab1")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab4")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab7")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab8")),
          ],
        )),
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab0")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab1")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab4")),
            ListTile(title: Text("热门tab")),
            ListTile(title: Text("热门tab"))
          ],
        )),
        KeepAliveWrapper(
            child: ListView(
          children: const [
            ListTile(title: Text("视频tab1")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab4")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab7")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab")),
            ListTile(title: Text("视频tab8")),
          ],
        ))
      ]),
    );
  }
}
