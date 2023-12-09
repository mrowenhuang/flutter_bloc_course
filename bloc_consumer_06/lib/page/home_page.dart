import 'package:bloc_consumer_06/bloc/counter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

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
                // @ penggunaan blocConsumer sama dengan menggabungkan blocBuilder dengan blocListener dalam 1 widget yang sama
                child: BlocConsumer<counter, int>(
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
