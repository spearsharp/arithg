import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class InfraViewPage extends StatefulWidget {
  final Map arguments;
  const InfraViewPage({Key? key, required this.arguments});

  @override
  State<InfraViewPage> createState() => _InfraViewPageState();
}

class _InfraViewPageState extends State<InfraViewPage>
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
    _tabController = TabController(length: 8, vsync: this);
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.black,
            foregroundColor: Colors.amberAccent[30],
            title: SizedBox(
              child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.indigoAccent,
                  dividerColor: Colors.black,
                  indicatorColor: Colors.red[900],
                  controller: _tabController,
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  tabs: const [
                    Tab(child: Center(child: Text("padding页"))),
                    Tab(child: Center(child: Text("row页"))),
                    Tab(child: Center(child: Text("colume页"))),
                    Tab(child: Center(child: Text("flex页"))),
                    Tab(child: Center(child: Text("stack页"))),
                    Tab(child: Center(child: Text("aspectRatio页"))),
                  ]),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            SizedBox(child: _paddingF()),
            SizedBox(child: _rowF()),
            SizedBox(child: _columeF()),
            SizedBox(child: _flexF()),
            SizedBox(child: _stackF()), //stack页
            SizedBox(child: _respectRatioF()),
          ],
        ));
  }
}

//icon 组件透传icons. 参数size color
class IconConainters extends StatelessWidget {
  Color color;
  double size;
  IconData icon;

  IconConainters(this.icon, {Key? key, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(),
      height: 100,
      width: 100,
      color: color,
      child: Center(
        child: Icon(
          icon,
          color: Colors.black87,
          size: this.size,
        ),
      ),
    );
  }
}

//padding feature
class _paddingF extends StatelessWidget {
  const _paddingF({super.key});
  List<Widget> grideViewList() {
    List<Widget> tmplist = [];
    for (var i = 0; i < 20; i++) {
      tmplist.add(
        Padding(
          padding: const EdgeInsets.all(10),
          child: Image.network(
            "https://www.itying.com/images/flutter/1.png",
            fit: BoxFit.cover,
          ),
        ),
      );
    }
    return tmplist;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1,
      children: grideViewList(),
      // [
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   Padding(
      //     padding: const EdgeInsets.all(3),
      //     child: Image.network(
      //       "https://www.itying.com/images/flutter/1.png",
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      // ],
    );
  }
}

//row feature
class _rowF extends StatelessWidget {
  const _rowF({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconConainters(Icons.home, // icon 透传
              size: 30,
              color: Colors.black12), // 非常量参数无法传值
          IconConainters(Icons.people, // icon 透传
              size: 30,
              color: Colors.pink),
          IconConainters(Icons.phone, // icon 透传
              size: 30,
              color: Colors.blue.shade400),
        ]);
  }
}

//colume feature
class _columeF extends StatelessWidget {
  const _columeF({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconConainters(Icons.home, // icon 透传
              size: 30,
              color: Colors.black12), // 非常量参数无法传值
          IconConainters(Icons.people, // icon 透传
              size: 30,
              color: Colors.pink),
          IconConainters(Icons.phone, // icon 透传
              size: 30,
              color: Colors.blue.shade400),
        ]);
  }
}

//flex feature, flex 只能放在row，column，flex里才能用expanded
class _flexF extends StatelessWidget {
  const _flexF({super.key});

  @override
  Widget build(BuildContext context) {
    return
        //pending on anlysis and completely understand the layout infra composing again
        // Container(
        //   height: double.infinity,
        //   width: double.infinity,
        //   child: Column(
        //     children: [
        //       Flex(
        //         mainAxisAlignment: MainAxisAlignment.spaceAround,
        //         direction: Axis.horizontal,
        //         children: [
        //           Expanded(
        //               flex: 1,
        //               child: IconConainters(Icons.home, // icon 透传
        //                   size: 30,
        //                   color: Colors.black12)),
        //           // const SizedBox(  // 在expand当中加sizedbox无效
        //           //   height: 10,ss
        //           // ),
        //           Expanded(
        //               flex: 3,
        //               child: IconConainters(Icons.search, // icon 透传
        //                   size: 30,
        //                   color: Colors.red)),
        //           Expanded(
        //               flex: 6,
        //               child: IconConainters(Icons.email, // icon 透传
        //                   size: 30,
        //                   color: Colors.blue)),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 20,
        //       ),
        //       //2nd Plugin
        ListView(
      children: [
        Container(
          width: double.infinity,
          height: 200.0,
          color: Colors.black,
        ),
        Row(
          children: [
            Expanded(
                flex: 2,
                child: SizedBox(
                  height: 180,
                  child: Image.network(
                      "https://www.itying.com/images/flutter/1.png"),
                )),
            Expanded(
              flex: 1,
              child: Container(
                  height: 180,
                  child: Container(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                  "https://www.itying.com/images/flutter/2.png")),
                          const SizedBox(
                            height: 3,
                          ),
                          Expanded(
                              flex: 1,
                              child: Image.network(
                                  "https://www.itying.com/images/flutter/3.png")),
                        ],
                      ))),
            ),
          ],
        )
      ],
    );
    //     ],
    //   ),
    // );
  }
}

//stack sub page
class _stackF extends StatefulWidget {
  const _stackF({super.key});

  @override
  State<_stackF> createState() => _stackFState();
}

class _stackFState extends State<_stackF> with SingleTickerProviderStateMixin {
  late TabController _subtablcontroller;
  @override
  void initState() {
    super.initState();
    _subtablcontroller = TabController(length: 4, vsync: this);
    _subtablcontroller.addListener(() {
      if (_subtablcontroller.animation!.value == _subtablcontroller.index) {
        print(_subtablcontroller.index);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _subtablcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber[100],
            foregroundColor: Colors.amberAccent[30],
            title: SizedBox(
              child: TabBar(
                  controller: _subtablcontroller,
                  unselectedLabelStyle: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w500),
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                  isScrollable: true,
                  labelColor: Color.fromARGB(255, 21, 3, 13),
                  dividerColor: Colors.black,
                  indicatorColor: Color.fromARGB(255, 5, 48, 113),
                  tabs: const [
                    Tab(
                      child: Center(
                          child: Text(
                        "一级",
                      )),
                    ),
                    Tab(
                      child: Center(
                        child: CircleAvatar(
                          backgroundImage: AssetImage("images/portrait.jpg"),
                        ),
                      ),
                    ),
                    Tab(
                      child: Text("三级"),
                    ),
                    Tab(
                      child: Text("四级"),
                    ),
                  ]),
            ),
          ),
        ),
        body: TabBarView(controller: _subtablcontroller, children: [
          SizedBox(
              child: Text.rich(TextSpan(
                  style: TextStyle(color: Colors.red),
                  text: "一级",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      const subStackPageFirst(
                        tt: 'TT',
                      );
                      print("2layer...");
                    }))),
          const Center(
              child: CircleAvatar(
                  backgroundImage: AssetImage("images/portrait.jpg"))),
          const Text("456"),
          const Text("789"),
        ]));
  }
}

//stack feature , no use ...
/*
class _TstackF extends StatelessWidget {
  const _TstackF({super.key});

  @override
  Widget build(BuildContext context) {
    final scrnSize = MediaQuery.of(context as BuildContext).size;
    final scrnWidth = scrnSize.width;
    final scrnHeight = scrnSize.height;

    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          children: const [
            Text("一级"),
            Text("二级"),
            Text("三级"),
            Text("四级"),
            Text("五级"),
            Text("六级"),
            Text("七级"),
            Text("八级"),
            Text("九级"),
            Text("十级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("二十级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("一级"),
            Text("最后级"),
          ],
        ),
        Positioned(
            width: scrnWidth,
            height: 30,
            child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text.rich(TextSpan(
                        style: TextStyle(color: Colors.red),
                        text: "一级",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("ff.....");
                          })),
                    Text.rich(TextSpan(
                        style: TextStyle(color: Colors.red),
                        text: "二级",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            const subStackPageFirst(
                              tt: 'TT',
                            );
                            print("2layer...");
                            // const _SstackF();
                          })),
                    Text.rich(TextSpan(
                        style: TextStyle(color: Colors.red),
                        text: "三级",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("thth.....");
                          })),
                    Text.rich(TextSpan(
                        style: TextStyle(color: Colors.red),
                        text: "四级",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("ff.....");
                          })),
                  ],
                ))),
      ],
    );
  }
}
*/
//unused _stackF statefull widge

//respectRatio feature
class _respectRatioF extends StatelessWidget {
  const _respectRatioF({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2 / 1,
        child: Container(
            color: Colors.blue,
            child: ListView(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 30,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 10,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.all(10),
                  elevation: 20,
                  child: const Column(children: [
                    ListTile(
                      title: Text("张三"),
                      subtitle: Text("高级软件工程师"),
                    ),
                    Divider(),
                    ListTile(title: Text("Zhongguo")),
                    ListTile(title: Text("Beijing s s")),
                  ]),
                ),
              ],
            )));
  }
}

// ignore: camel_case_types

class subStackPageFirst extends StatelessWidget {
  final String tt;
  const subStackPageFirst({Key? key, required this.tt}); // super.Key 跨组件
  @override
  void initState() {
    print(tt);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 500,
      width: 500,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        children: const [
          Text("一级.."),
          Text("二级.."),
          Text("三级.."),
          Text("四级.."),
          Text("五级.."),
          Text("六级.."),
          Text("七级.."),
          Text("八级.."),
          Text("九级.."),
          Text("十级.."),
          Text("一级.."),
          Text("一级.."),
          Text("一级.."),
          Text("一级."),
          Text("一级."),
          Text("一级"),
          Text("一级"),
          Text("二十级"),
          Text("一级"),
          Text("一级"),
          Text("一级"),
          Text("一级"),
          Text("最后级"),
        ],
      ),
    );
  }
}
