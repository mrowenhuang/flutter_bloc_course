import 'package:bloc_provider_value_09/bloc/counter.dart';
import 'package:bloc_provider_value_09/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // @ di sini kasus yang kita gunakan blocProvider kita taruh di dalam matrialApp namun menested myHomePage() kekurangnnya penggunaan seperti ini kita tidak bisa mengakses class blocProvider.of(context) pada halaman lain karena kita meletakan blocProvider yang langsung memanggil scaffold
      home: BlocProvider(
        create: (context) => counter(),
        child: MyHomePage(),
      ),
    );
  }
}
