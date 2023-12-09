import 'package:bloc_provider_value_09/bloc/counter.dart';
import 'package:bloc_provider_value_09/page/second_page.dart';
import 'package:bloc_provider_value_09/widget/ValueWidget.dart';
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
          // @ namun kita dapat mengirimkan data ke page lain dengan menggunakan navigator.push akan tetapi pada saat melakukan perpindahan page kita wajib mengirimkan class yang sudah kita inisialisasikan ke halaman yang kita tuju agar bisa menggunakan blocProvider.of(context)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return BlocProvider.value(
                  value: myCounter,
                  child: SecondPage(),
                );
              },
            ),
          );
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
