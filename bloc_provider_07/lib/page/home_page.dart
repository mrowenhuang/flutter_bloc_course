import 'package:bloc_provider_07/bloc/counter.dart';
import 'package:bloc_provider_07/widget/ValueWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myCounter = BlocProvider.of<counter>(context);

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
            const SizedBox(
              width: 150,
              child: Center(
                // @ penggunaan blocConsumer sama dengan menggabungkan blocBuilder dengan blocListener dalam 1 widget yang sama
                child: ValueWidget(),
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
