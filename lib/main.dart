import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_hx_app/screens/auth_screen/password_screen.dart';
import 'package:test_hx_app/screens/home_onboarding_screen/cubit/home_onboarding_cubit.dart';

import 'screens/splash_screen/splash_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => HomeOnboardingCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hoxton Wealth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Calhern',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
