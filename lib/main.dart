import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasty/screens/auth/registration_screen.dart';
import 'screens/auth/splash_screen.dart';


void main() => runApp(
  DevicePreview(
    builder: (context) =>  MyApp(), // Wrap your app
  ),
  // MyApp()
);

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: 'Wasty',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00BD15)),
        //useMaterial3: true,
      ),
      home:  SplashScreen(),

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

class Checkpoint extends StatefulWidget {
  const Checkpoint({super.key});

  @override
  State<Checkpoint> createState() => _CheckpointState();
}

class _CheckpointState extends State<Checkpoint> {
  String? finalEmail;

  Future<void> isRegistered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var getEmail = prefs.getString('email');

    setState(() {
      finalEmail = getEmail;
    });
  }

  @override
  void initState() {
    super.initState();
    isRegistered();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: isRegistered(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return finalEmail == null
              ?  SplashScreen()
              :  RegistrationScreen();
        },
      ),
    );
  }
}