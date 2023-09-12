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
  List<Widget> _initListView() {
    List<Widget> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(const ListTile(
        title: Text("动态列表"),
      ));
    }
    return list;
  }

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
    _tabController = TabController(
        length: 4, vsync: this); // pending on learn the vsync variable
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
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
              backgroundColor: Color.fromARGB(255, 202, 144, 144),
              elevation: 0.1,
              title: SizedBox(
                  child: TabBar(
                isScrollable: true,
                indicatorColor: Colors.red,
                unselectedLabelColor: Color.fromARGB(255, 18, 23, 18),
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                tabs: const [
                  Tab(child: (Text("静态list"))),
                  Tab(child: (Text("动态组建"))),
                  Tab(child: (Text("LVBlder"))),
                  Tab(child: (Text("动态LVBlder")))
                ],
              ))),
        ),
        body: TabBarView(controller: _tabController, children: [
          SizedBox(
            height:
                100, //sizedbox height无效 参考 https://cloud.tencent.com/developer/ask/sof/776772=
            child: ListView(
              children: <Widget>[
                const ListTile(leading: Icon(Icons.tiktok), title: Text("抖音")),
                const ListTile(
                    leading: Icon(Icons.airplane_ticket), title: Text("代付款")),
                const ListTile(
                    leading: Icon(Icons.card_giftcard_outlined),
                    title: Text("代收货")),
                const ListTile(
                    leading: Icon(Icons.favorite), title: Text("我的珍藏")),
                const Divider(),
                const ListTile(
                    leading: Icon(Icons.circle_notifications),
                    title: Text("在线客服")),
                ListTile(
                  leading: Image.network(
                      "https://www.itying.com/images/flutter/1.png"),
                  title: const Text('华北黄淮高温雨今起强势登场'),
                  subtitle: const Text("中国天气网讯 21日开始，华北黄淮高温雨今起强势登场"),
                ),
                const Divider(),
                ListTile(
                  leading: Image.network(
                      "https://www.itying.com/images/flutter/2.png"),
                  title: const Text('保监局50天开32罚单 “断供”违规资金为房市降温'),
                  subtitle: const Text("中国天气网讯 保监局50天开32罚单 “断供”违规资金为房市降温"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 40,
                  color: Colors.red,
                ),
                Container(
                  width: 180.0,
                  height: 40,
                  color: Colors.orange,
                  child: Column(
                    children: <Widget>[
                      Image.network(
                          "https://www.itying.com/images/flutter/1.png"),
                      const Text('我是一个文本')
                    ],
                  ),
                ),
                Container(
                  width: 180.0,
                  height: 40,
                  color: Colors.blue,
                ),
                Container(
                  width: 180.0,
                  height: 40,
                  color: Colors.deepOrange,
                ),
                Container(
                  width: 180.0,
                  height: 40,
                  color: Colors.deepPurpleAccent,
                )
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView(
              children: _initListView(),
            ),
          ),
          SizedBox(
            height: 80,
            child: ListPage(),
          )
        ]));
  }
}

//dynamic listView via ListView.builder
class ListPage extends StatelessWidget {
  List list = [];
  ListPage({Key? key}) : super(key: key) {
    for (var i = 0; i < 100; i++) {
      list.add("我是一个列表--$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${list[index]}"),
          );
        });
  }
}
