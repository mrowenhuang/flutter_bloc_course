import 'package:bloc_listener_05/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  counter myCounter = counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                myCounter.minData();
              },
              icon: Icon(Icons.remove),
            ),
            SizedBox(
              width: 150,
              child: Center(
                child: BlocListener<counter, int>(
                  bloc: myCounter,
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('Its Value Biggest than 5'),
                      ),
                    );
                  },
                  listenWhen: (previous, current) {
                    if (current >= 5) {
                      return true;
                    } else {
                      return false;
                    }
                  },
                  child: BlocBuilder<counter, int>(
                    bloc: myCounter,
                    // buildWhen: (previous, current) {
                    //   if (current >= 5) {
                    //     return true;
                    //   } else {
                    //     return false;
                    //   }
                    // },
                    builder: (context, state) {
                      return Text(
                        state.toString(),
                        style: Theme.of(context).textTheme.headlineLarge,
                      );
                    },
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                myCounter.addData();
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
