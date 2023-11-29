
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasty/screens/pages/landingPage.dart';
import 'package:wasty/utils/constants.dart';
import 'screens/auth/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  runApp(DevicePreview(builder: (BuildContext context) { 
    return OurApp();
   },
 ));
}

class OurApp extends StatefulWidget {
  OurApp({Key? key}) : super(key: key);

  @override
  State<OurApp> createState() => _OurAppState();
}

class _OurAppState extends State<OurApp> {
  late bool isAuthenticated;

  @override
  void initState() {
    super.initState();
    isAuthenticated = Constants.prefs?.getBool("loggedIn") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasty',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00BD15)),
      ),
      home: isAuthenticated ? SplashScreen() : LandingPage(),
      builder: EasyLoading.init(),
    );
  }
}
