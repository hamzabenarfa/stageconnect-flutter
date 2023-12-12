import 'package:flutter/material.dart';
import 'package:projetflutterdev/pages/auth/login_entreprise_page.dart';
import 'package:projetflutterdev/pages/entreprise_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/offer_page.dart'; // Import UserPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set the initial route
      routes: {

        '/': (context) => LoginPage(),
        '/login_entreprise': (context) => LoginEntreprisePage(),
        '/user': (context) => OfferPage(),
        '/entreprise': (context) => EntreprisePage(),
      },
    );
  }
}
