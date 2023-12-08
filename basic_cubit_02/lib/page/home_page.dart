import 'package:basic_cubit_02/cubit/counter.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {

  counterData _counter = counterData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: _counter.stream,
            initialData: _counter.data,
            builder: (context, snapshot) => Text(
              snapshot.data.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: () {
                  _counter.addData();
                },
                child: Text('ADD'),
              ),
              OutlinedButton(
                onPressed: () {
                  _counter.minData();
                },
                child: Text('MIN'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
