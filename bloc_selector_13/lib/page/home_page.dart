import 'package:bloc_selector_13/bloc/counter.dart';
import 'package:bloc_selector_13/bloc/profile.dart';
import 'package:bloc_selector_13/bloc/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var myCounter = BlocProvider.of<counter>(context);
    var myTheme = context.read<theme>();
    var myProfile = context.read<profile>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            // @ disini merupakan proses pengubahan nilai theme
            onPressed: () {
              myTheme.onActive();
            },
            icon: Icon(Icons.color_lens),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // @ di bawah ini merupakan global access
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return SecondPage();
          //     },
          //   ),
          // );

          // @ di bawah ini merupakan anonymous routes acccess
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return BlocProvider.value(
          //         value: myCounter,
          //         child: SecondPage(),
          //       );
          //     },
          //   ),
          // );

          // @ di bawah ini merupakan name routes access
          Navigator.pushNamed(context, "/secondPage");
        },
        child: Icon(
          Icons.navigate_next_rounded,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<profile, Map<String, dynamic>, int>(
              bloc: myProfile,
              selector: (state) {
                return state['age'];
              },
              builder: (context, state) {
                print('age');
                return Text(
                  "age = ${state}",
                  style: Theme.of(context).textTheme.headlineLarge,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    myProfile.onChangeInt(myProfile.state['age'] - 1);
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    myProfile.onChangeInt(myProfile.state['age'] + 1);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
            BlocSelector<profile, Map<String,dynamic>, String>(
            
              selector: (state) {
                return state['name'];
              },
              builder: (context, state) {
                print('name');
                return Text(
                  "name = $state",
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
            TextField(
              onChanged: (value) {
                return myProfile.onChangeName(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
