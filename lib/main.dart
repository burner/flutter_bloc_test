import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/isolated/isolated_screen.dart';
import 'package:untitled/isolated/isolated_state.dart';
import 'package:untitled/random/random_bloc.dart';
import 'package:untitled/random/random_screen.dart';
import 'package:untitled/random/random_state.dart';

import 'counter/counter_bloc.dart';
import 'counter/counter_screen.dart';
import 'counter/counter_state.dart';

import 'isolated/isolated_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.pinkAccent,
        ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
            providers: [
              BlocProvider<CounterBloc>(
                  create: (BuildContext context) =>
                      CounterBloc(CounterState(0))),
              BlocProvider<RandomBloc>(
                  create: (BuildContext context) => RandomBloc(RandomState(0))),
              BlocProvider<IsolatedBloc>(
                  create: (BuildContext context) =>
                      IsolatedBloc(IsolatedState.withoutValue())),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: Text("BLoC Counter"),
              ),
              body: SingleChildScrollView(
                  child: Column(children: <Widget>[
                CounterPage(),
                RandomPage(),
                IsolatedPage(),
                Center(child: BlocBuilder<CounterBloc, CounterState>(
                    builder: (context, state) {
                  return BlocBuilder<RandomBloc, RandomState>(
                      builder: (context2, state2) {
                    return Text((state.count + state2.count).toString());
                  });
                }))
              ])),
            )));
  }
}
