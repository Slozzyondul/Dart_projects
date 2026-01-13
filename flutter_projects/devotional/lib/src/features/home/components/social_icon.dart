import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  final IconData icon;

  const SocialIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.stone200),
      ),
      child: Icon(icon, color: AppColors.stone600, size: 20),
    );
  }
}
