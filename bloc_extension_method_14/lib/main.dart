import 'package:bloc_extension_method/bloc/counter.dart';
import 'package:bloc_extension_method/bloc/profile.dart';
import 'package:bloc_extension_method/bloc/theme.dart';
import 'package:bloc_extension_method/widget/app.dart';
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
      child: app(),
    );
  }
}
