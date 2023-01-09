import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class IsolatedState extends Equatable {
  final int count;
  final bool isLoading;
  const IsolatedState(this.count): isLoading = false;
  const IsolatedState.withoutValue(): count = 0, isLoading = true;
  @override
  List<Object> get props => [isLoading, count];
}