import 'package:arithg/tabs/user/login.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import '../pages/form.dart';
import '../pages/searchPage.dart';
import '../pages/search.dart';
import '../pages/news.dart';
import '../utils/tabs.dart';
import 'routers/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // String title = "test", subtitle = "subtitle";
  // String args = "搜索页面传值";
  // var num = "1";
//map routers

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: "/", // 初始化路由
//deploy onGenerateRoute
        onGenerateRoute: onGenerateRoute,
        home: const BottomTabs()
        // home: LoginPage(
        //   arguments: const {"title": "title"},
        // )
        //bottom divider
        );
  }
}
