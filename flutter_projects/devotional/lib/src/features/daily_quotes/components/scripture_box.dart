import 'package:devotional/src/common_widgets/constants/app_colors.dart';
import 'package:devotional/src/common_widgets/constants/app_styles.dart';
import 'package:flutter/material.dart';

class ScriptureBox extends StatelessWidget {
  const ScriptureBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.skyBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.skyBlue.withValues(alpha: 0.3),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.all(48),
      child: Column(
        children: [
          const Icon(
            Icons.format_quote,
            size: 48,
            color: Color(0x4D333333), // charcoal/30
          ),
          const SizedBox(height: 24),
          Text(
            '"The Lord is my shepherd; I shall not want. He makes me lie down in green pastures. He leads me beside still waters. He restores my soul."',
            textAlign: TextAlign.center,
            style: AppStyles.serifDisplay.copyWith(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              height: 1.6,
              color: AppColors.charcoalGrey,
            ),
          ),
          const SizedBox(height: 32),
          Container(width: 48, height: 1.0, color: Colors.black12),
          const SizedBox(height: 8),
          Text(
            'PSALM 23:1-3',
            style: AppStyles.sansDisplay.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              color: AppColors.charcoalGrey.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
