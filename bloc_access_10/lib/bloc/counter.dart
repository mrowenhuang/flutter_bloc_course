import 'package:bloc/bloc.dart';

class counter extends Cubit<int> {
  counter({this.data = 0}) : super(data);

  int data;

  void addData() {
    emit(state + 1);
  }

  void minData() {
    emit(state - 1);
  }
}
