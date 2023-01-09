import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class RandomState extends Equatable {
  final int count;
  const RandomState(this.count);
  @override
  List<Object> get props => [count];
}