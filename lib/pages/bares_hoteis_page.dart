import 'package:flutter/material.dart';

class BaresHoteisPage extends StatelessWidget {
  const BaresHoteisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bares & Hotéis'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Bares & Hotéis',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
} 