import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_demo/bloc_from_scratch/bloc_from_scratch.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
      title: 'BLoC Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocFromScratchPage(title: 'BLoC Pattern'),
    );
}
