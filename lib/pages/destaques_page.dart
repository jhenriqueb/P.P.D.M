import 'package:flutter/material.dart';

class DestaquesPage extends StatelessWidget {
  const DestaquesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Destaques'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Destaques',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
} 
