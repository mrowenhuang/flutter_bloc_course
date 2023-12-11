import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_listenner_12/bloc/counter.dart';
import 'package:multi_bloc_listenner_12/bloc/theme.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var myCounter = context.read<counter>();
    var myTheme = context.read<theme>();

    return MultiBlocListener(
      listeners: [
        BlocListener<theme, bool>(
          bloc: myTheme,
          listener: (context, state) {
            // TODO: implement listener
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Dark Theme On"),
              ),
            );
          },
          listenWhen: (previous, current) {
            if (current == true) {
              return true;
            }
            return false;
          },
        ),
        BlocListener<counter, int>(
          bloc: myCounter,
          listener: (context, state) {
            // TODO: implement listener
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Value now if ${state} mod by 2 = 0"),
              ),
            );
          },
          listenWhen: (previous, current) {
            if (current % 2 == 0) {
              return true;
            }
            return false;
          },
        ),
      ],
      child: BlocBuilder<counter, int>(
        bloc: myCounter,
        builder: (context, state) {
          return Text(
            state.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          );
        },
      ),
    );
  }
}
