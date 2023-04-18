import 'package:flutter_bloc_lite/flutter_lite_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends BaseLiteBloc<int, CounterEvent> {
  CounterBloc() : super(0);

  @override
  int mapEventToState(CounterEvent event) {
    switch (event) {
      case CounterEvent.increment:
        return state + 1;
      case CounterEvent.decrement:
        return state - 1;
    }
  }
}
