import 'package:flutter/material.dart';
import 'package:social_fun/home/screens/child_registration_page.dart';
import 'package:social_fun/shared/widgets/main_app_bar.dart';

class ChildListScreen extends StatelessWidget {
  final List<String>
      childrenNames; // Simulando que tenemos solo nombres por ahora

  const ChildListScreen({super.key, required this.childrenNames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const SocialFunAppBar(title: 'SocialFun'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RegisterChildScreen(),
            ),
          );
        },
        backgroundColor: Colors.grey,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Lista de niños registrados:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              // Lista de niños
              Expanded(
                child: ListView.builder(
                  itemCount: childrenNames.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: _buildChildCard(childrenNames[index], context),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChildCard(String name, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/avatar_placeholder.png'),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterChildScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(80, 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 4),
                        textStyle: const TextStyle(fontSize: 14),
                      ),
                      child: const Text('Editar'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
