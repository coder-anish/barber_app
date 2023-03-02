import 'package:flutter/material.dart';
import 'package:barber_app/screens/wearos/wear_dashboard.dart';
import 'package:barber_app/screens/wearos/wear_login.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner:  false,
    title: 'WearOS',
    home: const LoginScreen(),
    routes: {'/wearhome': (context) => const DashboardScreen()},
  ));
}