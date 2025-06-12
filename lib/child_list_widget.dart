import 'package:flutter/material.dart';
import 'package:social_fun/main_app_bar.dart';

class ChildListScreen extends StatelessWidget {
  final List<String> childrenNames; // Simulando que tenemos solo nombres por ahora

  const ChildListScreen({super.key, required this.childrenNames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SocialFunAppBar(
        title: 'SocialFun',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 6),

            const Text(
              'Lista de niños registrados:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),

            // Lista horizontal de niños
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                itemCount: childrenNames.length,
                itemBuilder: (context, index) {
                  return _buildChildCard(childrenNames[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // Botón para añadir niño
            GestureDetector(
              onTap: () {
                // TODO: Navegar a pantalla de registro de nuevo niño
              },
              child: const Column(
                children: [
                   CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Añadir niño',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildChildCard(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage('assets/avatar_placeholder.png'), // Imagen de avatar por defecto
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              // TODO: Ver detalles del niño o navegar a su perfil
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFC0CAFF),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 4,
            ),
            child: Text(
              name,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
