import 'package:example/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_lite/flutter_lite_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(elevation: 0, title: const Text('Flutter Lite Bloc')),
        body: LiteBlocBuilder<int, CounterEvent>(
          bloc: CounterBloc(),
          builder: (context, state) => Center(child: Text('$state')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => LiteBlocProvider.of<CounterBloc>(context)
              .add(CounterEvent.increment),
          child: const Icon(Icons.add),
        ),
      );
}
