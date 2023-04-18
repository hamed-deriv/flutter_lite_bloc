import 'package:flutter/material.dart';

import 'package:flutter_bloc_lite/flutter_lite_bloc.dart';

class LiteBlocListener<State, Event> extends StatelessWidget {
  const LiteBlocListener({
    required this.child,
    this.bloc,
    required this.listener,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final BaseLiteBloc<State, Event>? bloc;
  final void Function(BuildContext context, State data) listener;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<State>(
      stream: (bloc ?? LiteBlocProvider.of<BaseLiteBloc<State, Event>>(context))
          .stream,
      builder: (BuildContext context, AsyncSnapshot<State> snapshot) {
        if (snapshot.hasData) {
          listener(context, snapshot.data!);
        }

        return child;
      },
    );
  }
}
