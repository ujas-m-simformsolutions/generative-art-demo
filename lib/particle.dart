import 'dart:ui';

import 'package:flutter/material.dart';

class Particle {
  Offset position;
  Color color;
  double speed;
  double theta;

  double radius;

  Particle({
    this.color =  Colors.cyan,
    required this.position,
    required this.radius,
    required this.speed,
    required this.theta,
  });
}

class Rectangle{
  Offset offset;
  Color color;
  Rectangle(this.offset,this.color);
}