import 'package:bloc_extension_method/page/home_page.dart';
import 'package:flutter/material.dart';

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
          create: (context) => SubjectBloc(),
        ),
        BlocProvider(
          create: (context) => SubjectBloc(),
        ),
      ],
      child: Container(),
    )
  }
}
