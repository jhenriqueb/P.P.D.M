import 'package:flutter/material.dart';

class AltaGastronomiaPage extends StatelessWidget {
  const AltaGastronomiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alta Gastronomia'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Alta Gastronomia',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
} 