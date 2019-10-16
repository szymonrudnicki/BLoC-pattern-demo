import 'dart:async';

import 'package:flutter_bloc_pattern_demo/counter_event.dart';

class CounterStratchBloc {
  int _counter = 0;

  final _counterStateController = StreamController<int>();

  StreamSink<int> get _inCounter => _counterStateController.sink;

  Stream<int> get counter => _counterStateController.stream;

  final _counterEventController = StreamController<CounterEvent>();

  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterStratchBloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterEvent event) {
    switch(event) {
      case CounterEvent.increment:
        _counter++;
        break;
      case CounterEvent.decrement:
        _counter--;
        break;
    }
    _inCounter.add(_counter);
  }

  void dispose() {
    _counterEventController.close();
    _counterStateController.close();
  }
}
