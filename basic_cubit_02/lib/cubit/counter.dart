import 'package:bloc/bloc.dart';

class counterData extends Cubit<int> {
  // @ pada constructor ini kita bisa membuat inisialisasi data menjadi tidak mutlak dan kita juga bisa menginisialisasi data awalnya
  counterData({this.data = 0}) : super(data);

  // @ pada constructor ini pada saat kita memanggil class ini kita wajib melakukan inisialisasi data di awal
  //^ counterData(super.initialState);

  int data;

  void addData() {
    emit(state + 1);
  }

  void minData() {
    emit(state - 1);
  }
}
