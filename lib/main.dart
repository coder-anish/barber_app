
import 'package:barber_app/navigation/navbar.dart';
import 'package:barber_app/screens/googlemap/googlemap.dart';
import 'package:barber_app/screens/login.dart';
import 'package:barber_app/screens/register.dart';
import 'package:flutter/material.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => const LoginScreen(),
      '/registerscreen':(context) => const RegisterScreen(),
      '/googlescreen':(context) => const GoogleScreen(),
      '/dashboard' : (context) => const BottomNavigationScreen(),
      
    }
  ));
}
