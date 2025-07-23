import 'package:flutter/material.dart';

class PertoDeMimPage extends StatelessWidget {
  const PertoDeMimPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perto de Mim'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Aqui aparecerá o mapa (Google Maps)',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
} 