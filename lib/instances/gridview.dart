import 'package:arithg/res/listData.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  final Map arguments;
  const GridViewPage({super.key, required this.arguments});

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        if (_tabController.animation!.value == _tabController.index) {
          print(_tabController.index);
        }
      }
    });
  }

  List<Widget> _gridViewData() {
    var templist = listData.map((e) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black26,
              width: 1.0,
              style: BorderStyle.solid,
            )),
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.fromLTRB(1, 1, 1, 1),
        child: Column(children: [
          Image.network(e["imageUrl"]),
          Text(e["title"]),
          Text(e["author"]),
        ])));
    return templist.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              backgroundColor: Color.fromARGB(255, 242, 82, 98),
              elevation: 0.1,
              title: SizedBox(
                  child: TabBar(
                      labelPadding: const EdgeInsets.all(8),
                      indicatorWeight: 1,
                      isScrollable: true,
                      indicatorColor: Color.fromARGB(255, 244, 244, 242),
                      labelColor: Color.fromARGB(224, 243, 242, 242),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 249, 89, 2),
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                      unselectedLabelStyle: TextStyle(fontSize: 13),
                      unselectedLabelColor: Color.fromARGB(255, 143, 152, 143),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorPadding: EdgeInsets.all(1),
                      controller: _tabController,
                      tabs: const [
                    Text("静态Map"),
                    Text("动态Map现实"),
                    Text("动态gridVBLDer"),
                  ])),
            )),
        body: TabBarView(controller: _tabController, children: [
          SizedBox(
            child: GridView.count(
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0,
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: _gridViewData(),
            ),
          ),
          SizedBox(
            child: GridView.count(
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 3.0,
              crossAxisCount: 5,
              childAspectRatio: 2.0,
              children: const <Widget>[
                Icon(Icons.home),
                Icon(Icons.ac_unit),
                Icon(Icons.search),
                Icon(Icons.settings),
                Icon(Icons.airport_shuttle),
                Icon(Icons.all_inclusive),
                Icon(Icons.beach_access),
                Icon(Icons.cake),
                Icon(Icons.circle),
              ],
              // children: _gridViewData(),
            ),
          ),
          const SizedBox(
            child: _GridVBLD(),
            // children: _gridViewData(),
          ),
        ]));
  }
}

class _GridVBLD extends StatelessWidget {
  // gridview.builder
  const _GridVBLD({Key? key}) : super(key: key);
  Widget _initGridBLD(context, index) {
    return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
            Image.network(listData[index]["imageUrl"]),
            Text(listData[index]["title"]),
            Text(listData[index]["author"]),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listData.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
        itemBuilder: _initGridBLD);
  }
}
