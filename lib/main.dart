import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:spotify/screens/welcome_page.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
      home: const WelcomePage(),
    );
  }
}
