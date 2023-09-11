import 'package:flutter/material.dart';
import '../pages/searchPage.dart';
import '../pages/form.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  String title = "test";
  String subtitle = "我是标题";
  String searchtxt = "我是明明路由测试传值";
  var num = "1"; //transmit a number type to test
  @override
  Widget build(BuildContext context) {
    // return const Center(child: Text("Category Page"));
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                //route to Formpage
                Navigator.pushNamed(context, "/search", arguments: {
                  // num: num,
                  // title: title,
                  "searchtxt": searchtxt,
                });
                //route to searchpage  ,direct route
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return SearchPage(
                //     title: title,
                //     subtitle: subtitle,
                //     num: num,
                //   );
                // }));
              },
              // child: const Icon(Icons.app_registration_outlined))),
              child: const Text("搜索")),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                //route to Formpage
                Navigator.pushNamed(context, "/form", arguments: {
                  num: num,
                  title: title,
                  subtitle: subtitle,
                });
              },
              child: const Text("跳转到表单")),
          const SizedBox(height: 20),
          ElevatedButton(
              // onHover: () {
              //   Navigator.pushNamed(context, "/form");
              // },
              onPressed: () {
                //route to Formpage
                Navigator.pushNamed(context, "/news", arguments: {
                  num: num,
                  title: title,
                  subtitle: subtitle,
                });
              },
              child: const Text("命名路由跳转"))
        ],
      ),
    );
    // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    // ignore: dead_code
  }
}
