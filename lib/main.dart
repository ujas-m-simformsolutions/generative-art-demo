import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generative_art_demo/demo_painter.dart';
import 'package:generative_art_demo/particle.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home:Home(),
    );
  }
}
