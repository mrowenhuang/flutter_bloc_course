import 'package:bloc_access_10/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myCounter = context.read<counter>();

    return BlocConsumer<counter, int>(
      bloc: myCounter,
      listenWhen: (previous, current) {
        if (current % 2 == 0) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        // TODO: implement listener
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 1),
            content: Text(
              "Value now ${state}",
            ),
          ),
        );
      },
      buildWhen: (previous, current) {
        if (current % 2 == 0) {
          return true;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return Text(
          state.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        );
      },
    );
  }
}
