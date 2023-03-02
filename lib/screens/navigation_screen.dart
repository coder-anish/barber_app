import 'package:cybershop/models/profiles.dart';
import 'package:cybershop/screens/cart/cart_page.dart';
import 'package:cybershop/screens/cart/screen.dart';
import 'package:cybershop/screens/order_history/order_history.dart';
import 'package:cybershop/screens/profile_page/profile_screen.dart';
import 'package:cybershop/utils/sideNav.dart';
import 'package:flutter/material.dart';
import './homepage_screen.dart';
import './signin.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationDrawers extends StatefulWidget {
  @override
  State<NavigationDrawers> createState() => _NavigationDrawersState();
}

class _NavigationDrawersState extends State<NavigationDrawers> {
  int _selectedIndex = 0;
  List<Widget> lstWidget = [
    HomePage(),
    const OrderHistory(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(247, 14, 15, 14),
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 237, 218, 7),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 10,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
      body: lstWidget[_selectedIndex],
    );
  }
}
