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
      Icon(Icons.play_for_work_sharp),
      Icon(Icons.add_a_photo_outlined),
      IconButton.outlined(
          onPressed: () {
            print("icon测试");
          },
          icon: Icon(Icons.add_business_sharp)),
      IconButton(
        icon: Icon(IconsPool.music1),
        onPressed: () {
          print("private icons");
        },
      ),
      IconButton(
        icon: Icon(IconsPool.music1),
        onPressed: () {
          print("private icons");
        },
      )
    ])));
  }
}
