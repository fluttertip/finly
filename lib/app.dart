import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

class FinlyApp extends StatelessWidget {
  const FinlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finly',
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
