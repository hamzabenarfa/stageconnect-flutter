import 'package:flutter/material.dart';

class EntreprisePage extends StatelessWidget {
  const EntreprisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entreprise Page'),
      ),
      body: const Center(
        child: Text('Welcome to Entreprise Page!'),
      ),
    );
  }
}
