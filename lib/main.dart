import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/screens/home_page.dart';
import 'package:spotify/screens/welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(enabled: false, builder: (context) => const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? firstLogin = false;
  Future<bool?> _checkFirstLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    firstLogin = prefs.getBool('FIRST_LOGIN');
    if (firstLogin == null) {
      firstLogin = true;
      await prefs.setBool('FIRST_LOGIN', true);
    } else {
      firstLogin = false;
    }
    return firstLogin;
  }

  @override
  void initState() {
    _checkFirstLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: Colors.grey[300],
            selectedItemColor: Colors.green.shade100),
        fontFamily: 'Roboto',
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: firstLogin! ? const WelcomePage() : const HomePage(),
    );
  }
}
