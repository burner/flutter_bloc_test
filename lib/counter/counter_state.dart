import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState(this.count);
  @override
  List<Object> get props => [count];
}

class Ready extends CounterState {
  const Ready() : super(0);
}

class Running extends CounterState {
  int counter;
  Running({required this.counter}) : super(0);
}