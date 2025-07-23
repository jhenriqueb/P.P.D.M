import 'package:flutter/material.dart';

class FastFoodsPage extends StatelessWidget {
  const FastFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fast Foods'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Página de Fast Foods',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
} 