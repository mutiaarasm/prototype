import 'package:flutter/material.dart';
import 'package:prototype/widgets/botton_navbar_project.dart';
import '../../constants/app_colors.dart';
import '../../widgets/primary_button.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBarProjects(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/explore');
          } else if (index == 1) {
            // already on projects
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/inbox');
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/profile');
          }
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header
           Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Projects',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.search, color: AppColors.blue),
                  ),
                ],
              ),
            ),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.neutralblue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    _TabButton(label: 'To do', selected: false),
                    _TabButton(label: 'In progress', selected: false),
                    _TabButton(label: 'Finished', selected: true),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 80),

            // konten
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: AppColors.lightBlueBg,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.image,
                size: 40,
                color: AppColors.lightestblue,
              ),
            ),

            const SizedBox(height: 24),

            // Text
            const Text(
              'Nothing here. For now.',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This is where you’ll find your\nfinished projects.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                color: AppColors.lightGrey,
              ),
            ),

            const SizedBox(height: 35),

            // Start
            SizedBox(
              width: 140,
              child: PrimaryButton(
                text: 'Start a project',
                onPressed: () {
                  // TODO: handle navigation
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String label;
  final bool selected;

  const _TabButton({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: selected ? AppColors.blue : AppColors.lightGrey,
            ),
          ),
        ),
      ),
    );
  }
}
