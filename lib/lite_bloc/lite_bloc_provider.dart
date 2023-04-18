import 'package:flutter/material.dart';

import 'package:flutter_bloc_lite/lite_bloc/base_lite_bloc.dart';

class LiteBlocProvider<Bloc extends BaseLiteBloc> extends InheritedWidget {
  const LiteBlocProvider({
    required this.bloc,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  final Bloc bloc;

  static Bloc of<Bloc extends BaseLiteBloc>(BuildContext context) {
    final LiteBlocProvider<Bloc>? provider =
        context.dependOnInheritedWidgetOfExactType<LiteBlocProvider<Bloc>>();

    if (provider == null) {
      throw Exception('No provider');
    }

    return provider.bloc;
  }

  @override
  bool updateShouldNotify(LiteBlocProvider<Bloc> oldWidget) =>
      bloc != oldWidget.bloc;
}
