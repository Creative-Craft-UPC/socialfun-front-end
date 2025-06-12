import 'package:flutter/material.dart';
import 'package:social_fun/app_colors.dart';

class SocialFunAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onLogout;

  const SocialFunAppBar({
    super.key,
    required this.title,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 16.0), // <- Padding derecho
            child: TextButton(
              onPressed: onLogout?? () {
                // TODO: Lógica de cerrar sesión
              },
              child: const Text(
                'Cerrar sesión',
                style: TextStyle(
                  color: AppColors.danger,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
