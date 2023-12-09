import 'package:bloc_access_10/bloc/counter.dart';
import 'package:bloc_access_10/error/404.dart';
import 'package:bloc_access_10/page/home_page.dart';
import 'package:bloc_access_10/page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// @ di sini kita membuat class baru untuk melakukan inisialisasi data route di mana data route yang masuk akan di cek lalu akan di kirimkan ke halaman yang sudah tertera bila halaman route tidak ada dia akan pindah ke dalam error page
class myRouter {
  counter myCounter = counter();

  Route onRoutes(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: myCounter,
              child: MyHomePage(),
            );
          },
        );

      case "/secondPage":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: myCounter,
              child: SecondPage(),
            );
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return errorPage();
          },
        );
    }
  }
}
