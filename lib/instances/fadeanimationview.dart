import 'package:flutter/material.dart';

class FadeAnimationPage extends StatefulWidget {
  final Map arguments;
  const FadeAnimationPage({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<FadeAnimationPage> createState() => _FadeAnimationPageState();
}

class _FadeAnimationPageState extends State<FadeAnimationPage> {
  final globalkey = GlobalKey<AnimatedListState>();
  List<String> list = [
    // "第一条数据",
    // "第二条数据",
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("fade animation demo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          list.add("这是一条数据");
          globalkey.currentState!.insertItem(list.length - 1);
        },
        child: Icon(Icons.add_alarm),
      ),
      body: AnimatedList(
        key: globalkey,
        initialItemCount: list.length,
        itemBuilder: (context, index, animation) {
          return FadeTransition(
              opacity: animation,
              child: ListTile(
                title: Text(list[index]),
                trailing: Icon(Icons.delete),
              ));
        },
      ),
    );
  }
}
