import 'package:flutter/material.dart';
import 'package:task_project/presentation/screens/navigationbar/navigationbar.dart';
import 'package:task_project/presentation/screens/accountscreen/accountscreen.dart';
import 'package:task_project/presentation/screens/homescreen/homescreen.dart';
import 'package:task_project/presentation/screens/searchscreen/searchscreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const HomeScreen(), 
    const SearchScreen(), 
    const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
