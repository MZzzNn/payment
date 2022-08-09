import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:payment/core/style/themes.dart';

import 'core/bloc_observer.dart';
import 'data/data_sources/remote/dio_helper.dart';
import 'modules/register/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelperPayment.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Payment App',
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: ThemeMode.light,
      home: const RegisterScreen(),
    );
  }
}
