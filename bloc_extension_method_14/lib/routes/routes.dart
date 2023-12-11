
import 'package:bloc_extension_method/bloc/counter.dart';
import 'package:bloc_extension_method/bloc/profile.dart';
import 'package:bloc_extension_method/bloc/theme.dart';
import 'package:bloc_extension_method/error/404.dart';
import 'package:bloc_extension_method/page/home_page.dart';
import 'package:bloc_extension_method/page/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// @ di sini kita membuat class baru untuk melakukan inisialisasi data route di mana data route yang masuk akan di cek lalu akan di kirimkan ke halaman yang sudah tertera bila halaman route tidak ada dia akan pindah ke dalam error page
class myRouter {

  var myCounter = counter();

  Route onRoutes(RouteSettings route) {
    switch (route.name) {
      case '/':
      // @ pada bagian menuju homePage karena terdapat 2 buah bloc yang ingin kita gunakan yaitu counter dan theme maka di sini kita juga akna mengirimkan class bloc nya ke dalam home dengan menggunakan multiblocprovider yang di mana bloc providernya bukan create melainkan value
        return MaterialPageRoute(
          builder: (context) {
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(
                  value: context.read<counter>(),
                ),
                BlocProvider.value(
                  value: context.read<theme>(),
                ),
                BlocProvider.value(
                  value: context.read<profile>(),
                ),
              ],
              child: MyHomePage(),
            );
          },
        );

      case "/secondPage":
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider.value(
              value: BlocProvider.of<counter>(context), // ! sama dengan context.read<counter>()
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
