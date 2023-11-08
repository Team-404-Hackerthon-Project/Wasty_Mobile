import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';
import 'package:wasty/screens/thanks.dart';

import 'screens/home.dart';
import 'screens/landingPage.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => const MyApp(), // Wrap your app
  ),
  // const MyApp()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Wasty',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00BD15)),
        //useMaterial3: true,
      ),
      home: LandingPage(),

      // routes: {
      //   '/splash': (context) => SplashScreen(),
      //   '/registration': (context) => RegistrationScreen(),
      //   '/forgot': (context) => ForgotPasswordScreen(),
      //   '/signin': (context) => SignInScreen(),
      //   '/landing': (context) => DashBord(),
      // },
    );
  }
}

