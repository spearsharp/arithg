import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  final Map arguments;
  const ListViewPage({super.key, required this.arguments});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage>
    with SingleTickerProviderStateMixin {
  //tabbar controller
  late TabController _tabController;

  //dispose _tabContorller
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        // pending on check the arttribute value
        print(_tabController.index);
      }
    });
  }

  // @override
  // void initState
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: AppBar(
              backgroundColor: Color.fromARGB(255, 253, 247, 247),
              elevation: 0.1,
              title: SizedBox(
                  child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.green,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                tabs: const [
                  Tab(child: (Text("静态list"))),
                  Tab(child: (Text("引用list"))),
                  Tab(child: (Text("引用LVBlder")))
                ],
              ))),
        ),
        body: TabBarView(controller: _tabController, children: [
          ListView(
            children: const <Widget>[
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是二个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是n个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("我是N个标题")),
            ],
          ),
          ListView(
            children: const <Widget>[
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是n个标题")),
              ListTile(title: Text("他是N个标题")),
            ],
          ),
          ListView(
            children: const <Widget>[
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("我是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是一个标题")),
              ListTile(title: Text("他是n个标题")),
              ListTile(title: Text("他是N个标题")),
            ],
          ),
        ]));
  }
}
