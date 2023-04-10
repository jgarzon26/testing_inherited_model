import 'dart:developer' as devtools;

import 'package:flutter/material.dart';

import '../home/home.dart';

class AvailableColorWidget extends InheritedModel<AvailableColors> {
  final MaterialColor color1;
  final MaterialColor color2;

  const AvailableColorWidget({
    Key? key,
    required this.color1,
    required this.color2,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant AvailableColorWidget oldWidget) {
    devtools.log('updateShouldNotify');
    return color1 != oldWidget.color1 || color2 != oldWidget.color2;
  }

  @override
  bool updateShouldNotifyDependent(covariant AvailableColorWidget oldWidget,
      Set<AvailableColors> dependencies) {
    if (dependencies.contains(AvailableColors.one) &&
        color1 != oldWidget.color1) {
      devtools.log('updateShouldNotifyDependent: color1');
      return true;
    }

    if (dependencies.contains(AvailableColors.two) &&
        color2 != oldWidget.color2) {
      devtools.log('updateShouldNotifyDependent: color2');
      return true;
    }

    return false;
  }

  static AvailableColorWidget of(BuildContext context, AvailableColors aspect) {
    return InheritedModel.inheritFrom<AvailableColorWidget>(context,
        aspect: aspect)!;
  }
}
