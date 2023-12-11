import 'package:flutter_bloc/flutter_bloc.dart';

class theme extends Cubit<bool> {
  theme({this.isActive = false}): super (isActive);

  bool isActive;

  void onActive () {
    emit(!state);
  }

  @override
  void onChange(Change<bool> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
  
}