import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'services/screeenAdapter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/localStorage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flatter Game",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final StreamController<int> _inputController =
      StreamController.broadcast(); //multiple listener
  final StreamController<int> _scoreController = StreamController.broadcast();
  final StreamController<int> _levelController = StreamController.broadcast();

  int score = 0;
  int level = 1;
  late var clevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: StreamBuilder(
              stream: _scoreController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if (score >= 0) {
                    score += snapshot.data as int;
                    if (score < 0) {
                      score = 0;
                    }
                  } else {
                    score = 0;
                  }
                  if (level >= 1) {
                    level = (score ~/ 10);
                    if (level < 1) {
                      level = 1;
                    }
                  } else {
                    level = 1;
                  }
                  // localStorage.setData("levelName", level);
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Text("您的得分： $score"),
                        Text(
                          "关卡： $level",
                        )
                      ],
                    ));
              }),
        ),
        body: Stack(
          children: [
            // clevel = localStorage.getData("levelName"),
            // Text("Children level: $clevel"),
            ...List.generate(level, (index) {
              return Game(
                  inputController: _inputController,
                  scoreController: _scoreController,
                  levelController: _levelController);
            }),
            // localStorage.removeData("levelName"),
            KeyPad(inputController: _inputController)
          ],
        ));
  }
}

// Future<void> saveData(int level) async {
//   final prefs = await SharedPreferences.getInstance();
//   prefs.setInt("CurrentLevel", level);
// }

// Future<int?> fetchData() async {
//   final prefs = await SharedPreferences.getInstance();
//   Future<int?> clevel;
//   // ignore: unrelated_type_equality_checks
//   if (prefs.getInt("CurrentLevel") == "") {
//     clevel = 0 as Future<int?>;
//     print("Currentlevel is  null: $clevel");
//   } else {
//     clevel = prefs.getInt("CurrentLevel") as Future<int?>;
//     print("Currentlevel is not null: $clevel");
//   }
//   return clevel;
// }

//Arithmatic game section
class Game extends StatefulWidget {
  final StreamController<int> inputController;
  final StreamController<int> scoreController;
  final StreamController<int> levelController;
  const Game(
      {super.key,
      required this.inputController,
      required this.scoreController,
      required this.levelController});
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  late double x;
  late int a, b, c, d, e, f, g, netscore, levelevent;
  late Color color;
  late bool t, l;
  String m = '()';
  String n = '/';
  late AnimationController _animationController;

//game restart
  reset() {
    t = true;
    d = Random().nextInt(5) + 1;
    e = Random().nextInt(5);
    x = Random().nextDouble() * 320;
    color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  // levelup(level) {
  //   int speed = (5000 + 5000 / 2 * level) as int;
  //   return speed;
  // }

  //score update
  score(t) {
    if (t) {
      widget.scoreController.add(3);
      netscore = netscore + 3;
      if (netscore > 10) {
        l = true;
        netscore = 0;
      }
    } else {
      widget.scoreController.add(-1);
      netscore = netscore - 1;
      if (netscore < 0) {
        l = false;
        netscore = 0;
      }
    }
  }

  level(bool l) {
    // print("levelevent : ${levelevent}");
    if (l == true) {
      widget.levelController.add(1);
    } else if (l == false && levelevent > 1) {
      widget.levelController.add(-1);
    }
  }

//level up and awearded

  @override
  void initState() {
    a = Random().nextInt(99);
    b = Random().nextInt(99);
    c = Random().nextInt(9);
    late int speed;
    netscore = 0;
    super.initState();

    reset(); //first round to play
    // TODO: implement initState
    _animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: Random().nextInt(5000) + 5000));
    _animationController.forward();
    _animationController.addStatusListener((status) {
      //listening KeyPad press

      if (status == AnimationStatus.completed) {
        t = false;
        score(t);
        reset();
        _animationController.forward(from: 0.0);
      }
      //get inputController data,and monitorring
      widget.inputController.stream.listen((event) {
        int total = d + e;
        if (total == event) {
          t = true;
          score(t);
          // level levelup or leveldown check
          level(l);
          reset();
          _animationController.forward(from: 0.0);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    double screenHeight = queryData.size.height;
    double screenWidth = queryData.size.width;
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Positioned(
              top: Tween(begin: -10.00, end: 500.00)
                  .animate(_animationController)
                  .value,
              left: x,
              child: Container(
                  padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(18)),
                  child:
                      // ignore: unnecessary_brace_in_string_interps
                      Text("$d+$e=?", style: const TextStyle(fontSize: 18))));
        });
  }
}

//keypad monitorring
class KeyPad extends StatelessWidget {
  final StreamController<int> inputController;
  const KeyPad({super.key, required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
          // color: Colors.red,
          child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 5 / 2,
        children: List.generate(9, (index) {
          return TextButton(
              style: ButtonStyle(
                  shape:
                      MaterialStateProperty.all(const RoundedRectangleBorder()),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.primaries[index][300]),
                  foregroundColor: MaterialStateProperty.all(Colors.black45)),
              onPressed: () {
                inputController.add(index + 1);
              },
              child: Text("${index + 1}",
                  style: Theme.of(context).textTheme.headlineMedium));
        }),
      )),
    );
  }
}
