import 'package:flutter/material.dart';
import 'package:task_project/presentation/screens/accountscreen/accountscreen.dart';
import 'package:task_project/presentation/screens/snackbar/snackbar.dart';

import 'presentation/screens/homescreen/homescreen.dart';
import 'presentation/screens/loginscreen/loginscreen.dart';
import 'presentation/screens/searchscreen/searchscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const Loginscreen(),
        '/home': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
        '/accounts': (context) => AccountScreen()
      },
      scaffoldMessengerKey: scaffoldMessengerKey,
      home: Loginscreen(),
    );
  }
}
