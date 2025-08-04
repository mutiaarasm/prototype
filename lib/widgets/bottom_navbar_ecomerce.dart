import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class BottomNavBarEcommerce extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBarEcommerce({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _BottomNavItem(
            iconPath: 'assets/icon/Explore.png',
            label: 'Explore',
            active: currentIndex == 0,
            onTap: () => onTap(0),
          ),
          _BottomNavItem(
            iconPath: 'assets/icon/Categories.png',
            label: 'Categories',
            active: currentIndex == 1,
            onTap: () => onTap(1),
          ),
          _BottomNavItem(
            iconPath: 'assets/icon/Store.png',
            label: 'Stores',
            active: currentIndex == 2,
            onTap: () => onTap(2),
          ),
          _BottomNavItem(
            iconPath: 'assets/icon/Profile.png',
            label: 'Profile',
            active: currentIndex == 3,
            onTap: () => onTap(3),
          ),
        ],
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _BottomNavItem({
    required this.iconPath,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            iconPath,
            width: 24,
            height: 24,
            color: active ? AppColors.blue : AppColors.lightGrey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontFamily: 'Inter',
              color: active ? AppColors.blue : AppColors.lightGrey,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
