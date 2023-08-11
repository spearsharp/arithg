import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'services/screeenAdapter.dart';

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

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: StreamBuilder(
              stream: _scoreController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  score += snapshot.data as int;
                  return Text("您的得分： ${score}");
                }
                if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return const Text("监听中..");
              }),
        ),
        body: Stack(
          children: [
            ...List.generate(3, (index) {
              return Game(
                  inputController: _inputController,
                  scoreController: _scoreController);
            }),
            KeyPad(inputController: _inputController)
          ],
        ));
  }
}

//Arithmatic game section
class Game extends StatefulWidget {
  final StreamController<int> inputController;
  final StreamController<int> scoreController;
  const Game(
      {super.key,
      required this.inputController,
      required this.scoreController});
  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> with SingleTickerProviderStateMixin {
  late double x;
  late int a, b, c, d, e, f, g;
  late Color color;
  late bool t;
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

  //score update
  score(t) {
    print("t: ${t}");
    if (t) {
      print("true: ${t}");
      widget.scoreController.add(3);
    } else {
      print("false: ${t}");
      print(t);
      widget.scoreController.add(-1);
    }
  }

  @override
  void initState() {
    a = Random().nextInt(99);
    b = Random().nextInt(99);
    c = Random().nextInt(9);
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
        // widget.scoreController.add(-1);
        reset();
        _animationController.forward(from: 0.0);
      }
      //get inputController data,and monitorring
      widget.inputController.stream.listen((event) {
        int total = d + e;
        print("d+e : ${total}");
        print("event: ${event}");
        if (total == event) {
          t = true;
          score(t);
          // widget.scoreController.add(3);
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
