import 'dart:math';

import 'package:flutter/material.dart';
import 'package:generative_art_demo/particle.dart';

class DemoPainter extends CustomPainter {
  List<Rectangle> particles;
  List<Offset> offset;
  Color color;
  DemoPainter(this.particles, this.offset,this.color);

  @override
  void paint(Canvas canvas, Size size) {

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(
    //         Rect.fromCenter(
    //             center: const Offset(0,0),
    //             width: 20,
    //             height: 20),
    //         const Radius.circular(0)),
    //     paint);
    for (var p in particles) {
      var paint = Paint()..color = p.color;

      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: p.offset,
                  width: 20,
                  height: 20),
              const Radius.circular(0)),
          paint);
    }
  }

  @override
  bool shouldRepaint(DemoPainter oldDelegate) {
    return oldDelegate.color !=color;
  }
}
//not using right now
// Offset polarToCartesian(double speed, double theta) {
//   return Offset(speed * cos(theta), speed * sin(theta));
// }