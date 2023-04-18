import 'dart:async';

abstract class BaseLiteBloc<State, Event> {
  BaseLiteBloc(State initialState) {
    _controller.add(initialState);
  }

  final _controller = StreamController<State>.broadcast();

  Stream<State> get stream =>
      _controller.stream..listen((event) => _state = event);

  late State _state;

  State get state => _state;

  State mapEventToState(Event event);

  void dispose() => _controller.close();
  void add(Event event) => _controller.add(mapEventToState(event));
}
