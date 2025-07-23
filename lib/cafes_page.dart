import 'package:flutter/material.dart';

class CafesPage extends StatelessWidget {
  const CafesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cafés'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Cafés',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
} 