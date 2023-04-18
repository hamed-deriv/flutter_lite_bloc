import 'package:flutter/material.dart';

import 'package:flutter_bloc_lite/flutter_lite_bloc.dart';

import 'package:example/counter_bloc.dart';
import 'package:example/home_page.dart';

void main() {
  runApp(
    LiteBlocProvider<CounterBloc>(
      bloc: CounterBloc(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const HomePage(),
    );
  }
}
