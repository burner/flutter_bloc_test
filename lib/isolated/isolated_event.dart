import 'package:equatable/equatable.dart';

abstract class IsolatedEvent extends Equatable {
  const IsolatedEvent();

  @override
  List<Object> get props => [];
}

class StartCompute extends IsolatedEvent {
  const StartCompute();
}

class StopCompute extends IsolatedEvent {
  final int value;
  const StopCompute(this.value);
}
