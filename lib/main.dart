import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'package:wasty/screens/registration_screen.dart';
import 'package:wasty/screens/forgot_password_screen.dart';
import 'package:wasty/screens/sign_in_screen.dart';
import 'screens/home.dart';
import 'screens/splash_screen.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),

  // const MyApp()

);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF00BD15)),
        useMaterial3: true,
      ),
      home: SplashScreen(),

      routes: {
        '/splash': (context) => SplashScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/forgot': (context) => ForgotPasswordScreen(),
        '/signin': (context) => SignInScreen(),
        '/landing': (context) => DashBord(),
      },
    );
  }
}

