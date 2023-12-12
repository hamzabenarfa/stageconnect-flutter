import 'package:flutter/material.dart';
import 'package:projetflutterdev/pages/auth/login_entreprise_page.dart';
import 'package:projetflutterdev/pages/entreprise_page.dart';
import 'package:projetflutterdev/pages/offer/add_offer.dart';
import 'package:projetflutterdev/pages/offer/edit_offer.dart';
import 'package:projetflutterdev/pages/offer/offer_list.dart';
import 'pages/auth/login_page.dart';

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

        '/': (context) => OfferList(),
        '/login_entreprise': (context) => LoginEntreprisePage(),
        '/entreprise': (context) => EntreprisePage(),
        '/addoffer': (context) => AddOfferPage(),
        '/editoffer': (context) => EditOfferPage(),
      },
    );
  }
}
