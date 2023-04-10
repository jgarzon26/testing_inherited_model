import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:testing_inherited_model/screens/home/home.dart';

import '../../providers/available_color.dart';

class ColorWidget extends StatelessWidget {
  final AvailableColors color;

  const ColorWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = AvailableColorWidget.of(context, color);

    switch (color) {
      case AvailableColors.one:
        log('Color 1');
        break;
      case AvailableColors.two:
        log('Color 2');
        break;
    }

    return Container(
        height: 100,
        color:
            color == AvailableColors.one ? provider.color1 : provider.color2);
  }
}
