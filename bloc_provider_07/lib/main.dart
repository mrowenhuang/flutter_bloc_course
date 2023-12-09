import 'package:bloc_provider_07/bloc/counter.dart';
import 'package:bloc_provider_07/page/home_page.dart';
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
    // @ penggunaan bloc provider itu memudahkan kita dalam menggunakan class tanpa perlu mengirimkan class kita ke dalam widget lain melainkan kita bisa menggunakan class tersebut di semua widget tanpa harus mengirimakan widget hanya dengan menggunakan blocprovider.of(context) di setiap ingin memanggil class
    return BlocProvider(
      create: (context) => counter(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
