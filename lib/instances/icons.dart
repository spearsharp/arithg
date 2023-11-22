import 'package:arithg/utils/iconsUtil.dart';
import 'package:flutter/material.dart';

class IconsInstances extends StatefulWidget {
  final Map arguments;
  const IconsInstances({super.key, required this.arguments});

  @override
  State<IconsInstances> createState() => _IconsInstancesState();
}

class _IconsInstancesState extends State<IconsInstances> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.play_for_work_sharp),
          Icon(Icons.add_a_photo_outlined),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton.outlined(
              icon: const Icon(Icons.add_business_sharp),
              onPressed: () {
                print("icon测试 biz add");
              }),
          IconButton(
            icon: const Icon(IconsPool.music1),
            onPressed: () {
              print("private icons");
            },
          ),
          IconButton(
            // style: ButtonStyle(
            //     maximumSize: MaterialStateProperty.all(const Size(10, 10))),
            icon: const Icon(IconsPool.facemask),
            onPressed: () {
              print("private icons wechat");
            },
          ),
        ],
      ),
    ])));
  }
}
