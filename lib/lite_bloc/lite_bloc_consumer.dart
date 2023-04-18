import 'package:flutter/material.dart';
import 'package:flutter_bloc_lite/flutter_lite_bloc.dart';

class LiteBlocConsumer<State, Event> extends StatelessWidget {
  const LiteBlocConsumer({
    this.bloc,
    required this.builder,
    required this.listener,
    Key? key,
  }) : super(key: key);

  final BaseLiteBloc<State, Event>? bloc;
  final Widget Function(BuildContext context, State data) builder;
  final void Function(BuildContext context, State data) listener;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<State>(
      stream: (bloc ?? LiteBlocProvider.of<BaseLiteBloc<State, Event>>(context))
          .stream,
      builder: (BuildContext context, AsyncSnapshot<State> snapshot) {
        if (snapshot.hasData) {
          listener(context, snapshot.data!);
          return builder(context, snapshot.data!);
        }

        throw Exception('No data');
      },
    );
  }
}
