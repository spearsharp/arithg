import 'package:arithg/main.dart';
import 'package:arithg/tabs/message.dart';
import 'package:flutter/material.dart';
import '../tabs/category.dart';
import '../tabs/home.dart';
import '../tabs/setting.dart';
import '../tabs/people.dart';
import '../utils/leftdrawer.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({super.key});

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _currentindex = 0;
  final List<Widget> _pages = const [
    Home(),
    Category(),
    Message(),
    Setting(),
    People()
  ];
  @override
  Widget build(BuildContext context) {
    var _currtap;
    return Scaffold(
        appBar: AppBar(
            actions: const [],
            title: const Text("flutter app"),
            titleTextStyle: const TextStyle(
                fontSize: 30, color: Color.fromARGB(137, 112, 75, 75))),
        drawer: const Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Spear 老师"),
              accountEmail: Text("spear.yao@goldmanfuks.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/portrait.jpg"),
              ),
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  image: DecorationImage(
                      image: AssetImage("images/flutter_pers.jpg"),
                      fit: BoxFit.cover)),
            ),
            // DrawerHeader(   // DrawerHeader without DrawerHeadACC
            //   decoration: const BoxDecoration(
            //       color: Colors.yellow,
            //       image: DecorationImage(
            //           // image: NetworkImage(
            //           //     "https://img9.doubanio.com/view/richtext/large/public/p113353176.jpg"),
            //           fit: BoxFit.cover,
            //           image: AssetImage("images/flutter_pers.jpg"))),
            //   child: ListView(
            //     children: const [Text("我是一个头部")],
            //   ),
            // ),
            ListTile(
                leading: CircleAvatar(child: Icon(Icons.access_time_outlined)),
                // onTap: HomePage(),
                title: Text("个人中心")),
            Divider(),
            ListTile(
                leading: CircleAvatar(child: Icon(Icons.access_time_outlined)),
                title: Text("系统设置"))
          ],
        )),
        body: _pages[_currentindex],
        // endDrawer: const Drawer(
        //     child: Column(children: [
        //   SizedBox(height: 20),
        //   ListTile(
        //       leading: CircleAvatar(child: Icon(Icons.people)),
        //       title: Text("个人中心"))
        // ])),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _currentindex = index;
                _currtap = index;
              });
            },
            currentIndex: _currentindex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: "home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category_outlined), label: "category"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: "message",
                  backgroundColor: Colors.red),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: "setting"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_outline), label: "people"),
            ]),
        floatingActionButton: Container(
          height: 56,
          width: 56,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 220, 220, 219),
              borderRadius: BorderRadius.circular(30)),
          child: FloatingActionButton(
              highlightElevation: double.maxFinite,
              onPressed: () {
                setState(() {
                  _currentindex = 2;
                });
                // ignore: avoid_print
                print(_currtap);
              },
              child: const Icon(Icons.add)),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }
}
