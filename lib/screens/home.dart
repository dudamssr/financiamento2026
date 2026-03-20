import 'package:flutter/material.dart';
import 'financiamento.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("App Financiamento")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Abrir Simulador"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Financiamento()),
            );
          },
        ),
      ),
    );
  }
}