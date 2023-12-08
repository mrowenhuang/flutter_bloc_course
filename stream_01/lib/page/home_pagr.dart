import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  // @ stream merupakan sebuah aliran di mana data akan terus mengalir 
  // ^ penggunaan async* untuk data yang memiliki stream
  Stream<int> streamData() async* {
    for (var i = 0; i < 11; i++) {
      // @ melakukan waktu tunggu selama 2 setik siap menunggu 2 detik baru akan masuk ke tahapn selanjutnya
      await Future.delayed(Duration(seconds: 2));
      // ^ fungsi yield sendiri merupakan fitur bawaan dalam stream yang di gunakan untuk memasukan data dalam stream itu sendiri
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream 01'),
        centerTitle: true,
      ),
      body: Center(
        // @ pada saat menggunakan stream untuk memanggil nilai dalam stream itu sendiri kita harus menggunakan streambuilder
        child: StreamBuilder(
          // ^ menginisialissasi function stream itu sendiri
          stream: streamData(),
          // ^ melakukan inisialisasi data awal dengan nilai 0
          initialData: 0,
          builder: (context, snapshot) =>  Text(
            // ^ memanggil data data yang ada di dalam stream dengan menambahkan .data
            snapshot.data.toString(),
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
