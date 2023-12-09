import 'package:bloc_access_10/bloc/counter.dart';
import 'package:bloc_access_10/page/second_page.dart';
import 'package:bloc_access_10/widget/ValueWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myCounter = BlocProvider.of<counter>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // @ di bawah ini merupakan global access
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return SecondPage();
          //     },
          //   ),
          // );

          // @ di bawah ini merupakan anonymous routes acccess
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return BlocProvider.value(
          //         value: myCounter,
          //         child: SecondPage(),
          //       );
          //     },
          //   ),
          // );

          // @ di bawah ini merupakan name routes access
          Navigator.pushNamed(context, "/secondPage");
        },
        child: Icon(
          Icons.navigate_next_rounded,
        ),
      ),
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
