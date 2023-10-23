import 'package:flutter/material.dart';

class Connector extends StatelessWidget {
  final myColor;
  double width = 20;
  Connector({super.key, this.width = 20, this.myColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 1,
      decoration: BoxDecoration(
          color: myColor,
          borderRadius: const BorderRadius.all(Radius.circular(3))),
    );
  }
}

// Color.fromARGB(255, 142, 141, 141),