import 'package:flutter/material.dart';
import '../../res/listData.dart';

class HeroAnimatedPage extends StatefulWidget {
  const HeroAnimatedPage({Key? key}) : super(key: key);

  @override
  State<HeroAnimatedPage> createState() => _HeroAnimatedPageState();
}

class _HeroAnimatedPageState extends State<HeroAnimatedPage> {
  List<Widget> _getListData() {
    var tempList = listData.map((value) {
      return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/hero", arguments: {
              "imageUrl": value['imageUrl'],
              "description": value["description"],
            });
          },
          child: Column(
            children: <Widget>[
              Hero(
                tag: value['imageUrl'],
                child: Image.network(value['imageUrl']
                
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                value['title'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20),
              )
            ],
          ));
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10),
      children: _getListData(),
    );
  }
}
