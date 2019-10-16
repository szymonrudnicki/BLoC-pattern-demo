import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern_demo/bloc_from_scratch/bloc_from_scratch.dart';
import 'package:flutter_bloc_pattern_demo/bloc_with_lib/bloc_with_lib.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'BLoC Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text("BLoC Demo"),
              bottom: TabBar(
                tabs: [
                  Tab(text: "From Scratch"),
                  Tab(text: "With Library"),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                BlocFromScratchPage(),
                BlocWithLibPage(),
              ],
            ),
          ),
        ),
      );
}
