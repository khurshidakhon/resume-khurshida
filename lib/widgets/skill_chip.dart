import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.tagBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.tagBorder),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppTheme.purple,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
