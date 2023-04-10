import 'package:flutter/material.dart';
import 'package:testing_inherited_model/screens/home/home.dart';

main() => runApp(
      MaterialApp(title: 'Testing Inherited Model', routes: {
        '/': (context) => const Home(),
      }),
    );
