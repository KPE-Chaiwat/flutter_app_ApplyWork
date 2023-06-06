import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Layout/MainPage.dart';
import 'cubit/shared_preferance_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  theme: ThemeData(scaffoldBackgroundColor: Color(0xfffed8c3)),
      title: 'Flutter SharedPreferences Demo',
      home: BlocProvider(
        create: (context) => SharedPreferanceCubit(),
        child: const HomePage(),
      ),
    );
  }
}
