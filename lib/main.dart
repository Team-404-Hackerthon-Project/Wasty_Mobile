import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:get/get.dart';

import 'screens/home.dart';

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
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Wasty',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF00BD15)),
        //useMaterial3: true,
      ),
      home: DashBord(),

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

