import 'package:equatable/equatable.dart';

abstract class RandomEvent extends Equatable {
  const RandomEvent();

  @override
  List<Object> get props => [];
}

class Randomize extends RandomEvent {
  const Randomize();
}
