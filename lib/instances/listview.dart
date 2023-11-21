import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListViewPage extends StatefulWidget {
  final Map arguments;
  const ListViewPage({super.key, required this.arguments});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  void _toastElevBIcon() {
    Fluttertoast.showToast(
        msg: "显示信息",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  const AlertDialog(
                      title: Text("Button phase - 62 curriculum"),
                      content: Text("ElevatedButton"));
                  _toastElevBIcon;
                },
                child: const Icon(Icons.elevator_outlined)),
            TextButton(
                onPressed: () {
                  const AlertDialog(
                    title: Text("Button phase - 62 curriculum"),
                    content: Text("textbutton"),
                  );
                  _toastElevBIcon;
                },
                child: const Icon(Icons.text_format_rounded)),
            OutlinedButton(
                onPressed: () {
                  const AlertDialog(
                      title: Text("Button phase curriculum"),
                      content: Text("OutlineButton"));
                  _toastElevBIcon;
                },
                child: const Icon(Icons.outlined_flag)),
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: const Icon(Icons.ac_unit_sharp),
                onPressed: () {
                  const AlertDialog(
                      title: Text("Button phase curriculum"),
                      content: Text("IconButton"));
                  _toastElevBIcon;
                }),
            ElevatedButton.icon(
                onPressed: _toastElevBIcon,
                icon: Icon(Icons.send_and_archive_outlined),
                label: Text("发送")),
            SizedBox(
                height: 40,
                width: 130,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        foregroundColor:
                            MaterialStateProperty.all(Colors.black87)),
                    onPressed: () {
                      _toastElevBIcon;
                    },
                    child: const Text("高度宽度"))),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              height: 30,
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text("自适应按钮"),
                onPressed: () {
                  print("自适应按钮");
                },
              ),
            ))
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.amber),
              foregroundColor: MaterialStateProperty.all(Colors.black38),
              elevation: MaterialStateProperty.all(10),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
          onPressed: () {
            print("圆角按钮");
          },
          child: Text("圆角按钮"),
        ),
        Container(
          height: 30,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber),
                foregroundColor: MaterialStateProperty.all(Colors.black38),
                shape: MaterialStateProperty.all(
                    CircleBorder(side: BorderSide(color: Colors.white38)))),
            onPressed: () {
              print("圆形按钮");
            },
            child:
                Container(margin: EdgeInsets.all(2), child: const Text("圆形按钮")),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 30,
                margin: const EdgeInsets.all(20),
                child: OutlinedButton(
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      side: MaterialStateProperty.all(const BorderSide(
                          width: 1, color: Colors.deepOrangeAccent))),
                  child: const Text("外边框按钮"),
                  onPressed: () {
                    print("边框按钮");
                  },
                ),
              ),
            )
          ],
        ),
        ListTile(
          leading: Text("aciton"),
          title: Text("Elevated Button"),
        ),
        ListTile(
          leading: Text("aciton"),
          title: Text("Elevated Button"),
        ),
        ListTile(
          leading: Text("aciton"),
          title: Text("Elevated Button"),
        ),
        ListTile(
          leading: Text("aciton"),
          title: Text("Elevated Button"),
        ),
        ListTile(
          leading: Text("aciton"),
          title: Text("Elevated Button"),
        ),
      ],
    ));
  }
}
