import 'package:bloc_access_10/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myCounter = BlocProvider.of<counter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<counter, int>(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              state.toString(),
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.purple,
                  ),
            );
          },
        ),
      ),
    );
  }
}
