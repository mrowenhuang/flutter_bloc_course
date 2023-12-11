import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_provider_11/bloc/counter.dart';
import 'package:multi_bloc_provider_11/bloc/theme.dart';
import 'package:multi_bloc_provider_11/widget/app.dart';

void main() {
  runApp(const MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @ pada pembelajaran ke 11 saya melakukan perubahan tersendiri pada penggunaan multiblocprovidernya di mana saya melanjutkan penggunaan topik 10 menggunakan generated route access

  // ^ pada halaman main nya kita implementasikan multi bloc providernya lalu widget app yang bersisi material app

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => theme(),
        ),
        BlocProvider(
          create: (context) => counter(),
        ),
      ],
      child: app(),
    );
  }
}

