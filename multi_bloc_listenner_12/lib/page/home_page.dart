import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:multi_bloc_listenner_12/bloc/counter.dart';
import 'package:multi_bloc_listenner_12/bloc/theme.dart';
import 'package:multi_bloc_listenner_12/widget/ValueWidget.dart';


// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myCounter = BlocProvider.of<counter>(context);
    var myTheme = context.read<theme>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            // @ disini merupakan proses pengubahan nilai theme
            onPressed: () {
              myTheme.onActive();
            },
            icon: Icon(Icons.color_lens),
          ),
        ],
      ),
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
