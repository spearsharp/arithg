import 'dart:async';

import 'package:flutter/material.dart';

class ScaleAnimationPage extends StatefulWidget {
  final Map arguments;
  const ScaleAnimationPage({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<ScaleAnimationPage> createState() => _ScaleAnimationPageState();
}

class _ScaleAnimationPageState extends State<ScaleAnimationPage> {
  final globalKey = GlobalKey<AnimatedListState>();
  List<String> list = ["1st", "2nd"];
  bool flag = true;

  Widget _buildItem(context, index) {
    return ListTile(
        key: ValueKey(index),
        title: Text(list[index]),
        trailing: IconButton(
          onPressed: () {
            _deleteItem(context, index);
          },
          icon: Icon(Icons.delete),
        ));
  }

//delete function,get current animatedList state through globalkey and remove the index list,and animated return -duration 50
  _deleteItem(context, index) {
    print("delete item");
    if (flag == true) {
      flag = false;
      print(index);
      setState(() {
        globalKey.currentState!.removeItem(index, (context, animation) {
          var item = _buildItem(context, index);
          list.remove(index);
          return ScaleTransition(
            scale: animation,
            child: item,
          );
        }, duration: const Duration(milliseconds: 50));
      });
      print(list.length);
      print(list);
      print("这是减去一条");
      const timeout = Duration(milliseconds: 60);
      Timer.periodic(timeout, (timer) {
        flag = true;
        timer.cancel();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale animation demo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(list.length);
          print(list);
          print("这是加上一条");
          list.add("这是一条");
          globalKey.currentState!.insertItem(list.length - 1);
        },
        child: Icon(Icons.add_box),
      ),
      body: AnimatedList(
        key: globalKey,
        initialItemCount: list.length,
        // ignore: avoid_types_as_parameter_names
        itemBuilder: (context, index, animation) {
          print("Atm:");
          print(animation);
          return ScaleTransition(
            scale: animation,
            child: ListTile(
                title: Text(list[index]),
                trailing: IconButton(
                  onPressed: () => _deleteItem(context, index),
                  icon: Icon(Icons.delete),
                )),
          );
        },
      ),
    );
  }
}
