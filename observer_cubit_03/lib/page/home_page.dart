import 'package:flutter/material.dart';
import 'package:observer_cubit_03/cubit/counter.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  counter _counter = counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: _counter.stream,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                snapshot.data.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              );
            }
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  _counter.addData();
                },
                child: Text("ADD"),
              ),
              OutlinedButton(
                onPressed: () {
                  _counter.minData();
                },
                child: Text("MIN"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
