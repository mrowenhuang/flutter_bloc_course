import 'package:bloc_extension_method/bloc/counter.dart';
import 'package:bloc_extension_method/bloc/profile.dart';
import 'package:bloc_extension_method/bloc/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // @ penggunaan read untuk membaca data sebanyak 1x dan data akan di baca jika di hot reload
    var myTheme = context.read<theme>();
    // @ select sama dengan watch namun select di gunakan untuk data yang lebih spedifik seperti maping 
    // ^ int age = context.select<profile, int>((bloc) => bloc.state['age']);
    // @ watch di gunakan untuk memantau data yang di tuju terus menerus
    // ^ var age = context.watch<profile>();

    // @ select dan watch merupakan data yang bila ingin di gunakan harus menggunakan builder bila tidak menggunakan builder pada saat ada perubahan seluruh data akan di ulang 

    print("rebuild");
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // @ builder di gunakan untuk mengurung data agar bagian yang terjadi perubahan merupakan data yang ada di dalam builder
            Builder(builder: (context) {
              var age = context.watch<profile>();

              return Text(
                age.state['age'].toString(),
                style: Theme.of(context).textTheme.headline2,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    context
                        .read<profile>()
                        .onChangeInt(context.read<profile>().state['age'] - 1);
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<profile>()
                        .onChangeInt(context.read<profile>().state['age'] + 1);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
