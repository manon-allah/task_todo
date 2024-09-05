import 'package:flutter/material.dart';
import 'package:todo_with_hive_cubit/view/widgets/custom_icon_search.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.titleApp, required this.icon, this.onPressed});

  final void Function()? onPressed;
  final String titleApp;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleApp,
          style: const TextStyle(fontSize: 32),
        ),
        const Spacer(),
        CustomIconSearch(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
