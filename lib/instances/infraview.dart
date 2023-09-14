import 'package:flutter/material.dart';

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
            SizedBox(child: _stackF()),
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
    return Flex(
      mainAxisAlignment: MainAxisAlignment.center,
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 1,
            child: IconConainters(Icons.home, // icon 透传
                size: 30,
                color: Colors.black12)),
        // const SizedBox(  // 在expand当中加sizedbox无效
        //   height: 10,
        // ),
        Expanded(
            flex: 3,
            child: IconConainters(Icons.search, // icon 透传
                size: 30,
                color: Colors.red)),
        Expanded(
            flex: 6,
            child: IconConainters(Icons.email, // icon 透传
                size: 30,
                color: Colors.blue)),
      ],
    );
  }
}

//stack feature
class _stackF extends StatelessWidget {
  const _stackF({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center, child: const Text("stack page"));
  }
}

//respectRatio feature
class _respectRatioF extends StatelessWidget {
  const _respectRatioF({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center, child: const Text("respect Ratio"));
  }
}
