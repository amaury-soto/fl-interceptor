import 'dart:math';

import 'package:flutter/material.dart';

class Background1 extends StatelessWidget {
  final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
        0.2,
        0.8
      ],
          colors: [
        Colors.white,
        Colors
            .white, /* Color.fromARGB(255, 72, 23, 125), */ /*  Color.fromARGB(255, 120, 80, 174) */
      ]));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: boxDecoration,
        ),
        Positioned(top: -90, left: -30, child: _PinkBox()),
        //Image(image: AssetImage('assets/tada1.webp'))
      ],
    );
  }
}

class _PinkBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 5,
      child: Container(
        width: 360,
        height: 360,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(80),
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 255, 188, 88),
              Color.fromARGB(255, 251, 244, 142)
            ])),
      ),
    );
  }
}
