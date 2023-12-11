import 'package:bloc_selector_13/bloc/counter.dart';
import 'package:bloc_selector_13/bloc/profile.dart';
import 'package:bloc_selector_13/bloc/theme.dart';
import 'package:bloc_selector_13/page/home_page.dart';
import 'package:bloc_selector_13/widget/app.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => theme(),
        ),
        BlocProvider(
          create: (context) => counter(),
        ),
        BlocProvider(
          create: (context) => profile(),
        ),
      ],
      child: const app(),
    );
  }
}
