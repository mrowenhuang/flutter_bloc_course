import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_bloc_listenner_12/bloc/counter.dart';
import 'package:multi_bloc_listenner_12/bloc/theme.dart';
import 'package:multi_bloc_listenner_12/widget/app.dart';

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
      ],
      child: app(),
    );
  }
}
