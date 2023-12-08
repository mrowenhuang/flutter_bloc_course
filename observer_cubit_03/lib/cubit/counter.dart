import 'package:bloc/bloc.dart';

class counter extends Cubit {
  counter({this.data = 0}) : super(data);

  int data;

  void addData() {
    emit(state + 1);
  }

  void minData() {
    emit(state - 1);
  }

  // @ onChange function this function use for monitor the change in the state
  @override
  void onChange(Change change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }

  // @ onError function this function use for monitor the error in the state
  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print(error);
  }
}
