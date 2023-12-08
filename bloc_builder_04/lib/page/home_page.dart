import 'package:bloc_builder_04/bloc/counter.dart';
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
                // @ penggunaan bloc builder memudahkan kita dalam menginisialisasi data dengan mengambil state dan juga memanggil class bloc tanpa melakukan penambahan .stream seperti penggunaan streamBuilder
                child: BlocBuilder<counter, int>(
                  bloc: myCounter,
                  // @ buildwhen di gunakan ketika kita membuat kondisi di mana kapan kita akan buat perubahan di mana pada saat kondisi true maka lakukan perubahan dan bila kondisi false jangan lakukan perubahan
                  buildWhen: (previous, current) {
                    if (current >= 5) {
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
