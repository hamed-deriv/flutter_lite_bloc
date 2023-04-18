import 'package:flutter/material.dart';

import 'package:flutter_bloc_lite/flutter_lite_bloc.dart';

class LiteBlocBuilder<State, Event> extends StatelessWidget {
  const LiteBlocBuilder({this.bloc, required this.builder, Key? key})
      : super(key: key);

  final BaseLiteBloc<State, Event>? bloc;
  final Widget Function(BuildContext context, State data) builder;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<State>(
      stream: (bloc ?? LiteBlocProvider.of<BaseLiteBloc<State, Event>>(context))
          .stream,
      builder: (BuildContext context, AsyncSnapshot<State> snapshot) {
        if (snapshot.hasData) {
          return builder(context, snapshot.data!);
        }

        throw Exception('No data');
      },
    );
  }
}
