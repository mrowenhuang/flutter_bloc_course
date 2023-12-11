import 'package:bloc_selector_13/bloc/theme.dart';
import 'package:bloc_selector_13/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class app extends StatelessWidget {
  const app({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ^ pada bagian ini kita menggunakan bloc builder karena kita akan mengubah themenya dari gelap ke terang
    return BlocBuilder<theme, bool>(
      bloc: context.read<theme>(),
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: state ? ThemeData.dark() : ThemeData.light(),
          debugShowCheckedModeBanner: false,
          // ^ di sini masi menggunakan generated route access untuk mengakses halamannya
          onGenerateRoute: myRouter().onRoutes,
        );
      },
    );
  }
}


