import 'package:flutter/material.dart';
import 'package:social_fun/app_colors.dart';

class SocialFunReturnAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBack;
  final VoidCallback? onLogout;

  const SocialFunReturnAppBar({
    super.key,
    this.onBack,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Botón de atrás
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: onBack ?? () => Navigator.pop(context),
          ),
          TextButton(onPressed: onBack ?? () => Navigator.pop(context), child: const Text('Atrás', style: TextStyle(color: Colors.black, fontSize: 20))),
          // Título centrado (usa Spacer para mantenerlo centrado)
          const Spacer(),
          const Text(
            'SocialFun',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          const Spacer(),

          // Botón cerrar sesión
          TextButton(
            onPressed: onLogout ?? () {},
            child: const Text(
              'Cerrar sesión',
              style: TextStyle(color: AppColors.danger),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
