import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class EventTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const EventTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.lightBlueBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.image, color: AppColors.lightestblue),
      ),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.black54),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.black),
      onTap: () {
        // Aksi ketika diklik (misal navigasi ke detail event)
      },
    );
  }
}
