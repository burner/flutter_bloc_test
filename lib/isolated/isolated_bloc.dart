import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/isolated/isolated_event.dart';
import 'package:untitled/isolated/isolated_state.dart';
import '../bloc.dart';

Future<int> computeImpl(int time) async {
  var random = Random();
  //await Future.delayed(Duration(seconds: time));
  var ret = 1.0;
  for(int i = 0; i < time; ++i) {
    ret = sqrt(ret + i);
  }

  //return Future<int>.value(random.nextInt(1000));
  return Future<int>.value(ret.round());
}

class IsolatedBloc extends Bloc<IsolatedEvent, IsolatedState> {
  var random = Random();

  IsolatedBloc(IsolatedState initialState) : super(initialState) {
    on<StartCompute>((event, emit) {
      emit(IsolatedState.withoutValue());
      doComputation();
    });
    on<StopCompute>((event, emit) {
      emit(IsolatedState(event.value));
    });
  }

  void doComputation() async {
    var newValue = await compute(computeImpl, 200000000);
    this.add(StopCompute(newValue));
  }

  @override
  IsolatedState get initialState => IsolatedState.withoutValue();
}