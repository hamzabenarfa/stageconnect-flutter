import 'package:flutter/material.dart';
import 'package:projetflutterdev/pages/auth/login_entreprise_page.dart';
import 'package:projetflutterdev/pages/offer/add_offer.dart';
import 'package:projetflutterdev/pages/offer/edit_offer.dart';
import 'package:projetflutterdev/pages/offer/offer_list.dart';
import 'package:projetflutterdev/pages/user_page.dart';
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

        '/': (context) => LoginPage(),
        '/login_entreprise': (context) => LoginEntreprisePage(),
        '/addoffer': (context) => AddOfferPage(),
        '/editoffer': (context) => EditOfferPage(),
        '/offerlist': (context) => OfferList(),
        '/userpage': (context) => UserPage(),
      },
    );
  }
}
