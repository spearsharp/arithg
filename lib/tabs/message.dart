import 'dart:io';
import 'dart:io';

import 'package:arithg/instances/animatedPlugin/animatedSlidePage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../instances/animatedPlugin/animatedSwitcher.dart';
import 'package:get/utils.dart';

import '../instances/animatedPlugin/animationctrlpage.dart';
import '../instances/animatedPlugin/heroanimatedPage.dart';
import '../instances/animatedPlugin/rotationanimation.dart';

class Message extends StatefulWidget {
  Message({Key? key}) : super(key: key);
  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  late int _currentIndex;
  @override
  Widget build(BuildContext context) {
    // return const Scaffold(body: Center(child: const Text("中间中间标题")));
    return Scaffold(
      body: ListView(
          // mainAxisAlignment: MainAxisAlignment.switch (expression) {    // pending to learn
          //   pattern => value,
          // },
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _tangle(),
            SizedBox(
              height: 2,
            ),
            _buttonA(),
            SizedBox(
              height: 2,
            ),
            _clipOvalPic(),
            SizedBox(
              height: 2,
            ),
            _iconInstances(),
            SizedBox(
              height: 1,
            ),
            _buildBottomTip(),
            SizedBox(
              height: 1,
            ),
            _listView(),
            SizedBox(
              height: 1,
            ),
            _container1(),
            SizedBox(
              height: 2,
            ),
            _statefullwidge(),
            SizedBox(
              height: 2,
            ),
            _animatedwidge(),
            SizedBox(
              height: 2,
            ),
            _animatedCtrl(),
            SizedBox(
              height: 20,
            ),
            animatedIcon(),
            SizedBox(height: 20),
          ]),
    );
  }
}

//方块栏
class _tangle extends StatelessWidget {
  const _tangle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(color: Colors.blue, blurRadius: 20.0)
              ], //边框阴影效果
              gradient: const LinearGradient(
                  colors: [Colors.yellow, Colors.red],
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerRight)),
          transform: Matrix4.rotationZ(0),
          child: Container(
              alignment: Alignment.center,
              // padding: EdgeInsets.all(60.0),
              child: Column(
                children: [
                  // Image.memory(bytes);
                  Image.file(
                      File("/Users/yaospear/Downloads/WechatIMG26215.jpg")),
                  const Text(
                    "你好",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    // textAlign: TextAlign.center,
                  )
                ],
              )),
        ));
  }
}

//按钮,三个蓝色文本按钮区域
class _buttonA extends StatelessWidget {
  const _buttonA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        //container1  listView组件
        Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1),
            // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            width: 70,
            height: 18,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                alignment: Alignment.center,
                // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text.rich(TextSpan(
                    text: "列表样例",
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/listView",
                            arguments: {"title": "title"});
                        print(
                            '点击文字按钮触发ListView方法'); // click to realize the onTap function
                      })))),
        // container2,gridview 组件
        Container(
            // margin: const EdgeInsets.all(6),
            // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1),
            width: 100,
            height: 18,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                alignment: Alignment.center,
                // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text.rich(TextSpan(
                    text: "gridview样例",
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, "/gridView",
                            arguments: {"title": "title"});
                        print(
                            '点击文字按钮触发方法'); // click to realize the onTap function
                      })))),
        // container3,Padding Row Colume Flex Stack Align Postioned Flutter AspectRation 组件
        Container(
            // margin: const EdgeInsets.all(6),
            // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1),
            width: 120,
            height: 18,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text.rich(TextSpan(
                  // reference https://cloud.tencent.com/developer/article/1780059?areaSource=102001.11&traceId=0Gxphjl_iz8uIH4euljbb
                  text: "Flutter布局组件样例",
                  style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/infraView",
                          arguments: {"title": "title"});
                      print(
                          '点击文字按钮触发方法'); // click to realize the onTap function
                    },
                )))),
//Container Button按钮组件
        Container(
            // margin: const EdgeInsets.all(6),
            // margin: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            // padding: const EdgeInsets.fromLTRB(0, 0, 0, 0), //离四周边距
            alignment: Alignment.center,
            margin: const EdgeInsets.all(1),
            width: 160,
            height: 18,
            decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 0.8),
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text.rich(TextSpan(
                  text: "Flutter按钮及State全样例",
                  style: const TextStyle(
                      fontSize: 11,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/buttonView",
                          arguments: {"title": "title"});
                      print(
                          '点击文字按钮触发方法'); // click to realize the onTap function
                    },
                )))),
      ],
    ));
  }
}

//字体点击样式，样例组件
class _buildBottomTip extends StatelessWidget {
  const _buildBottomTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: "跳到Key页面演示",
                  style: TextStyle(color: Colors.red),
                  // 文字链接
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/keypageView",
                          arguments: {"title": "title"}); // listView 例子
                      print('点击文字触发方法'); // click to realize the onTap function)
                    }),
              TextSpan(
                  text: "这是可以点击的文字",
                  style: TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, "/listView",
                          arguments: {"title": "title"}); // listView 例子
                      print('点击文字触发方法'); // click to realize the onTap function
                    })
            ],
          ),
        ),
      ],
    ));
  }
}

//圆形图标组件
class _clipOvalPic extends StatelessWidget {
  const _clipOvalPic({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: Image.asset(
      "images/portrait.jpg",
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    ));
  }
}

//图标组件
class _iconInstances extends StatelessWidget {
  const _iconInstances({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 30,
      decoration: BoxDecoration(),
      child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/iconsInstances",
                arguments: {"title": "icons"});
          },
          child: const Text(
            "图标",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800),
          )),
    );
  }
}

class _listView extends StatelessWidget {
  const _listView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/listView",
                arguments: {"title": "title"});
            print("ok");
          },
          icon: const Icon(Icons.list_sharp)),
    );
  }
}

//容器样式测试组件
class _container1 extends StatelessWidget {
  // gridview
  const _container1({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(1),
        padding: EdgeInsets.all(3),
        color: Colors.amber,
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/wrapView",
                arguments: {"title": "title"});
          },
          child: Text("wrap容器样式测试1"),
          // style: TextStyle(fontSize: 15),
        ));
  }
}

class _statefullwidge extends StatelessWidget {
  const _statefullwidge({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/countView",
                arguments: {"title": "title"});
          },
          child: const Text("自动计数器"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/fadeAnimationView",
                arguments: {"title": "title"});
          },
          child: const Text("隐式动画"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, "/scaleAnimationView",
                arguments: {"title": "title"});
          },
          child: const Text("显示动画"),
        ),
      ],
    );
  }
}

class _animatedwidge extends StatelessWidget {
  const _animatedwidge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        margin: EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AnimationSwitcher(title: "title1");
                }));
                // Navigator.pushNamed(context, "/countView",   // use router.dart
                //     arguments: {"title": "title"});
              },
              child: const Text("Switcher动画"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AnimationSwitcher(title: "title2");
                }));
              },
              child: const Text("自定义动画trinBlder"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/scaleAnimationView",
                    arguments: {"title": "title"});
              },
              child: const Text("改变子元素anibld"),
            ),
          ],
        ));
  }
}

class _animatedCtrl extends StatefulWidget {
  // final AudioPlayer audioPlayer;
  _animatedCtrl({super.key});

  @override
  State<_animatedCtrl> createState() => __animatedCtrlState();
}

class __animatedCtrlState extends State<_animatedCtrl> {
  AudioPlayer audioPlayer = AudioPlayer();

  void _musicPlay() async {
    await audioPlayer.play(UrlSource(
        'https://img3.tukuppt.com/newpreview_music/09/01/62/5c89fd22dea6948307.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const RotationAnimation();
            }));
          },
          child: const Text("旋转动画"),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const AnimationCtrlPage();
            }));
          },
          child: const Text("控制动画"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AnimatedSlidePage();
              }));
            },
            child: const Text("移动动画")),
        TextButton(
          onPressed: () {
            print("err output:");
            _musicPlay();
          },
          child: Text("播放"),
        ),
        TextButton(
          onPressed: () {
            print("err output:");
            audioPlayer.stop();
          },
          child: Text("暂停播放"),
        ),
      ],
    );
  }
}

class animatedIcon extends StatefulWidget {
  const animatedIcon();

  @override
  State<animatedIcon> createState() => __animatedIconState();
}

class __animatedIconState extends State<animatedIcon> {
  final GlobalKey _globalkey = GlobalKey();

  int _counter = 0;
  Future<int> getNetwordData() {
    return Future.value(12);
  }

  void _incrementCounter() {
    getNetwordData()
        .then((value) {
          return value * 2;
        })
        .then((value) => print(value))
        .onError((error, stackTrace) => {print(error)})
        .whenComplete(() => print("完成"));

    print("执行");
    print(_counter);
    setState(() {
      _counter++;
    });
  }

  void _incrementCounterErrCatch() async {
    try {
      await getNetwordData().then((value) {
        return value / 12;
      }).then((value) => print(value));
    } catch (e) {
      print(e);
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      direction: Axis.horizontal,
      children: [
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const RotationAnimation();
            }));
          },
          child: const Text("自定义Icon动画"),
        ),
        TextButton(
          onPressed: () {
            // final RenderBox _globalkeyrender =
            //     _globalkey.currentContext!.findRenderObject as RenderBox;
            // final Offset _globalkeyOffset =
            //     _globalkeyrender.localToGlobal(Offset.infinite);
            _incrementCounter();
            _incrementCounterErrCatch();
            // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            //   return const AnimationCtrlPage();
            // }));
          },
          child: const Text("自定义显示动画"),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AnimatedSlidePage();
              }));
            },
            child: const Text("自定义显示动画")),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const HeroAnimatedPage();
              }));
            },
            child: const Text("Hero动画")),
        // TextButton(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        //       return const RotationAnimation();
        //     }));
        //   },
        //   child: Text("旋转动画"),
        // ),
      ],
    );
  }
}
