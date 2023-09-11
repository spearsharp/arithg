import 'package:flutter/material.dart';
import '../utils/tabs.dart';
import '../pages/form.dart';
import '../pages/searchPage.dart';
import '../pages/news.dart';
import '../utils/dialog.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:ftoast/ftoast.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  var num = "1";
  String title = "test";
  String subtitle = "test subtitle";

  void _alertDialog() async {
    var result = await showDialog(
        barrierDismissible: true, // tapon gray bg -> display
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("提示信息"),
            content: const Text("确定要删除么？"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    print("取消");
                    Navigator.pop(context, 'cancel');
                  },
                  child: const Text("取消")),
              TextButton(
                  onPressed: () {
                    print("确定");
                    Navigator.pop(context, 'ok');
                  },
                  child: const Text("确定"))
            ],
          );
        });
    print(result);
  }

  void _simpleDialog() async {
    var result = await showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("请选择内容"),
            children: <Widget>[
              SimpleDialogOption(
                child: const Text("Option A"),
                onPressed: () {
                  print("option A");
                  Navigator.pop(context, "A"); // shorting keywords
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("option B"),
                onPressed: () {
                  print("option B");
                  Navigator.of(context).pop("B");
                },
              ),
              const Divider(),
              SimpleDialogOption(
                child: const Text("option C"),
                onPressed: () {
                  print("option B");
                  Navigator.of(context).pop("C");
                },
              )
            ],
          );
        });
    print("popupdialog");
    print(result);
  }

  void _modelBottomSheet() async {
    var result = await showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
              height: 220,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text("分享 A"),
                    onTap: () {
                      Navigator.pop(context, "分享A");
                    },
                  ),
                  const Divider(),
                  ListTile(
                      title: const Text("分享 B"),
                      onTap: () {
                        Navigator.pop(context, "分享B");
                      }),
                  const Divider(),
                  ListTile(
                      hoverColor: Colors.indigo,
                      title: const Text("分享 C"),
                      onTap: () {
                        Navigator.pop(context, "分享C");
                      })
                ],
              ));
        });
    print(result);
  }

  void _toast() {
    Fluttertoast.showToast(
        msg: "提醒信息",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

// void _modelSelectBottomSheet() async {
//   var result = await showModalBottomSheet(context: context, builder: (context) {
//     return Container(child: Column(children: [Row(children: [const Text("颜色："),IconButton(onPressed: onPressed, icon: Icons.ac_unit_sharp)],)],),);
//   }))
// }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(onPressed: _alertDialog, child: const Text("提示-弹出框")),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(onPressed: _simpleDialog, child: const Text("选择弹出框-弹出框")),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(onPressed: _modelBottomSheet, child: const Text("列表-弹出框")),
      const SizedBox(
        height: 20,
      ),
      ElevatedButton(onPressed: _toast, child: const Text("提醒信息-弹出框"))
    ]));
  }
}
