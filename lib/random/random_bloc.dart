import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:untitled/random/random_event.dart';
import 'package:untitled/random/random_state.dart';
import '../bloc.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  var random = Random();

  RandomBloc(RandomState initialState) : super(initialState) {
    on<Randomize>((event, emit) => emit(RandomState(random.nextInt(1000))));
  }

  @override
  RandomState get initialState => RandomState(0);
}