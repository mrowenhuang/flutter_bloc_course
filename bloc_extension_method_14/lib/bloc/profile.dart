import 'package:bloc/bloc.dart';

class profile extends Cubit<Map<String,dynamic>>{
  profile() : super ({"name" : "" , "age" : 0});

  void onChangeName (String name) {
    emit({
      "name" : name,
      "age" : state['age'],
    });
  }
  
  void onChangeInt (int age) {
    emit({
      "name" : state['name'],
      "age" : age,
    });
  }
}