part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {
  final int number;

  IncrementEvent({this.number = 1});
}

class DecrementEvent extends CounterEvent {}
