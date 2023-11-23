import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WrapViewPage extends StatefulWidget {
  final Map arguments;
  const WrapViewPage({super.key, required this.arguments});

  @override
  State<WrapViewPage> createState() => _WrapViewPageState();
}

class _WrapViewPageState extends State<WrapViewPage> {
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
      drawer: Drawer(),
      endDrawer: SizedBox(
        child: Text("wrap phase 123"),
      ),
      appBar: AppBar(
          title: Container(
              alignment: Alignment.center, child: Text("wrap phase123"))),
      body: const _LayoutEpisode(),

      // const Center(
      //   child: Text("wrap phase"),
      // ),
    );
  }
}

class _LayoutEpisode extends StatelessWidget {
  const _LayoutEpisode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: [
          Row(
            children: [
              Text(
                "热搜",
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          const Divider(),
          Wrap(
            spacing: 20,
            runSpacing: 12,
            children: [
              _Button_episode(
                "第一季",
                onPressed: () {},
              ),
              _Button_episode(
                "第二季",
                onPressed: () {},
              ),
              _Button_episode(
                "第三季",
                onPressed: () {},
              ),
              _Button_episode(
                "第三季",
                onPressed: () {},
              ),
              _Button_episode(
                "第四季",
                onPressed: () {},
              ),
              _Button_episode(
                "第五季",
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                "历史记录",
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
          const Divider(),
          const Column(
            children: [
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("时尚"),
              ),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("时尚"),
              ),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("时尚"),
              ),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("时尚"),
              ),
              ListTile(
                title: Text("女装"),
              ),
              Divider(),
              ListTile(
                title: Text("时尚"),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Stack(alignment: Alignment.bottomCenter, children: [
            OutlinedButton(onPressed: _toastElevBIcon, child: Text("清空历史记录"))
          ])
        ],
      ),
    );
  }

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
}

class _Button_episode extends StatelessWidget {
  String text;
  void Function()? onPressed;
  _Button_episode(this.text, {Key? key, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 236, 233, 233)),
            foregroundColor: MaterialStateProperty.all(Colors.black54)),
        child: Text(text));
  }
}
