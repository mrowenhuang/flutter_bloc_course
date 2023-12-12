import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementEvent>(
      (event, emit) {
        print(state);
        emit(
          state is CounterLoaded
              ? CounterLoaded(state.angka + event.number)
              : CounterLoaded(event.number),
        );
        print(state);
      },
    );
    on<DecrementEvent>(
      (event, emit) {
        print("dec : $state");
        emit(
          state is CounterLoaded
              ? CounterLoaded(state.angka - 1)
              : const CounterLoaded(-1),
        );
        print("dec : $state");
      },
    );
  }
}
