import 'package:flutter/material.dart';

import '../counter_event.dart';
import 'counter_bloc.dart';

class BlocFromScratchPage extends StatefulWidget {
  BlocFromScratchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BlocFromScratchPageState createState() => _BlocFromScratchPageState();
}

class _BlocFromScratchPageState extends State<BlocFromScratchPage> {
  final _bloc = CounterStratchBloc();

  @override
  Widget build(BuildContext context) => Scaffold(
      body: Center(
        child: StreamBuilder<int>(
            stream: _bloc.counter,
            builder: (context, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${snapshot.data}',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ],
                )),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(CounterEvent.increment),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(width: 8),
          FloatingActionButton(
            onPressed: () => _bloc.counterEventSink.add(CounterEvent.decrement),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ),
    );

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
