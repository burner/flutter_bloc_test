import 'dart:async';
import 'package:bloc/bloc.dart';
import '../bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState) {
    on<Increment>((event, emit) => emit(CounterState(state.count + 1)));
    on<Decrement>((event, emit) => emit(CounterState(state.count - 1)));
    on<Reset>((event, emit) => emit(CounterState(0)));
  }

  @override
  CounterState get initialState => Ready();

}