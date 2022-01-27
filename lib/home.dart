import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generative_art_demo/particle.dart';

import 'demo_painter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<Particle> particles = [];
  List<Rectangle> rectangles = [];

  final Random _rgn = Random(DateTime.now().millisecondsSinceEpoch);
  int count = 500;

  ///not using right now
  late AnimationController controller;
  List<Offset> offset = [];
  Color? color;

  @override
  void initState() {
    super.initState();
    var time = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      addOffset();
    });
    Future.delayed(const Duration(seconds: 10), () {
      time.cancel();
    });
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 10));
  }
//not using right now
  // void createBlocField() {
  //   final size = MediaQuery.of(context).size;
  //   final o = Offset(size.width / 2, size.height / 2);
  //   const n = 5;
  //   final r = size.width / n;
  //   const a = 0.2;
  //   blobField(r, n, a, o);
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: DemoPainter(rectangles, offset, color ?? Colors.deepPurple),
          child: Container(),
        ),
      ),
    );
  }
//not using right now
  // void blobField(double r, int n, double a, Offset o) {
  //   particles.add(Particle(position: o, radius: r, speed: 0, theta: 0));
  // }
  ///generates random color
  Color getRandomColor(Random rgn) {
    var a = rgn.nextInt(255);
    var r = rgn.nextInt(255);
    var g = rgn.nextInt(255);
    var b = rgn.nextInt(255);
    return Color.fromARGB(a, r, g, b);
  }

  List<int> numbers = [15, 30, 45, 60, 75];

  void addOffset() {
    const max = 25;
    var dx = 0.0;
    var dy = 0.0;
    color = getRandomColor(_rgn);
    for (var i = 0; i <= max; i++) {
      var rng = Random().nextInt(5);
      var choose = Random().nextInt(2);

      ///adds in one of the variable randomly
      if (choose == 0) {
        dx = dx + numbers[rng].toDouble();
      } else if (choose == 1) {
        dy = dy + numbers[rng].toDouble();
      }

      ///creates rectangle at list
      setState(() {
        rectangles.add(Rectangle(
            Offset(dx + MediaQuery.of(context).size.width / 2 - 150,
                dy + MediaQuery.of(context).size.height / 2 -150),
            color ?? Colors.deepPurple));
      });

      /// To break at some point to get randomness
      if (dx + dx == dy + dy) {
        break;
      }
    }
  }
}
