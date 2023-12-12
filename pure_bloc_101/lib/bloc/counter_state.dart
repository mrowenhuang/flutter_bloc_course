part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int angka;

  const CounterState(this.angka);
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(0);
}

final class CounterLoaded extends CounterState {
  const CounterLoaded(int angka) : super(angka);

}