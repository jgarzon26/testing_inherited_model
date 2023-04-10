import 'dart:math';

import 'package:flutter/material.dart';
import 'package:testing_inherited_model/screens/constants.dart';
import 'package:testing_inherited_model/screens/home/widgets/color.dart';
import 'package:testing_inherited_model/screens/providers/available_color.dart';

enum AvailableColors {
  one,
  two,
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var color1 = colors.getRandomElement(), color2 = colors.getRandomElement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: AvailableColorWidget(
        color1: color1,
        color2: color2,
        child: Column(
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      color1 = colors.getRandomElement();
                    });
                  },
                  child: const Text('Change Color 1'),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      color2 = colors.getRandomElement();
                    });
                  },
                  child: const Text('Change Color 2'),
                ),
              ],
            ),
            const ColorWidget(color: AvailableColors.one),
            const ColorWidget(color: AvailableColors.two),
          ],
        ),
      ),
    );
  }
}

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(
        Random().nextInt(length),
      );
}
