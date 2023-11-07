import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'home.dart';

void main() => runApp(
  DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),
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
      home: DashBord(),
    );
  }
}

