import 'package:flutter/material.dart';

class ChildEmptyList extends StatelessWidget {
  const ChildEmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF9ED6EF),
        elevation: 0,
        title: const Text(
          'SocialFun',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // <- Padding derecho
            child: TextButton(
              onPressed: () {
                // TODO: Lógica de cerrar sesión
              },
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
