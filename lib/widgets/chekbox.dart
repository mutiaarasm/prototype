import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class InterestCheckbox extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const InterestCheckbox({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
 Widget build(BuildContext context) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFE8F0FE) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppColors.border,
          width: 2,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                color: AppColors.black,
              ),
            ),
          ),
          // ✅ Gunakan ternary expression
          isSelected
            ? const SizedBox(
                width: 28,
                height: 28,
                child: Center(
                  child: Icon(
                    Icons.check,
                    size: 18,
                    color: AppColors.blue,
                  ),
                ),
              )
            : const SizedBox(width: 28, height: 28),

        ],
      ),
    ),
  );
} 
}
