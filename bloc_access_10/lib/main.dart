import 'package:bloc_access_10/bloc/counter.dart';
import 'package:bloc_access_10/page/home_page.dart';
import 'package:bloc_access_10/page/second_page.dart';
import 'package:bloc_access_10/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // @ di sini kita memanggil class routes nya
  myRouter router = myRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.onRoutes,

      // ^ pada bagian ini merupakan bagian name route access
      // initialRoute: "/home",
      // routes: {
      //   "/home": (context) => MyHomePage(),
      //   "/secondPage": (context) => SecondPage(),
      // },
    );
  }
}



// @ terdapata beberapa macam acces : 
  // @ 1. Local Access ci mana data di kirim secara local tanpa perantara
  // @ 2. Anonymous Route Access di mana data di kirim ke mana pun tanpa menggunakan nama seperti menggunakan navigator.push
  // @ 3. Name Route Access di mana kita akan menggunakan nama dalam melakukan pemanggilan dan pengiriman data seperti navigator.pushnamed
  // @ 4. Generated routed access ini merupakan routing di mana kita akan memisahkan halaman route dengan main file yang di mana cara kerja nya sendiri menggunakan penerimaan parameter route dan juga switch case
  // @ 5. Global Access di mana kita dapat mengakses semua data hanya dengan menggunakan navigator.push sama seperti penggunaan blocProvider di atas materialApp