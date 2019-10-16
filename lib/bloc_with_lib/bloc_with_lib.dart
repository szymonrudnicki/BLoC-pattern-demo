import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern_demo/bloc_with_lib/counter_lib_bloc.dart';

import '../counter_event.dart';

class BlocWithLibPage extends StatefulWidget {
  BlocWithLibPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BlocWithLibPageState createState() => _BlocWithLibPageState();
}

class _BlocWithLibPageState extends State<BlocWithLibPage> {
  final _bloc = CounterLibBloc();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: BlocBuilder<CounterLibBloc, int>(
          bloc: _bloc,
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$state',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              );
            }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.add(CounterEvent.increment),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () => _bloc.add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }
}
