import 'package:flutter/material.dart';
import 'package:prototype/widgets/primary_button.dart';
import 'package:prototype/widgets/secondary_button.dart';
import '../constants/app_colors.dart';
import '../widgets/bottomNavbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 24),

            const Center(
              child: Text(
                'Settings',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Profil
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlueBg,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(Icons.person, color: AppColors.lightestblue, size: 40),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: AppColors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.edit, size: 12, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const Center(
              child: Column(
                children: [
                  Text(
                    'Lucas Scott',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '@lucasscott3',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      color: AppColors.lightGrey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Settings menu
            const _SettingsItem(title: 'Saved Messages'),
            const _SettingsItem(title: 'Recent Calls'),
            const _SettingsItem(
              title: 'Devices',
              isFeedback: true,
              ),
            _SettingsItem(
              title: 'search',
              isSearch :true,
            ),
            _SettingsItem(
              title: 'Map',
              isMap : true
              ),
           _SettingsItem(
            title: 'Event',
            isEvent : true,
            ),
            _SettingsItem(
              title: 'Ecomerce',
              isEcomerce : true,
              ),
            _SettingsItem(
              title: 'Projects',
              isProjects :true,
              ),
            _SettingsItem(
              title: 'Log Out',
              isLogout : true,
              ),
          ],
        ),
      ),
       bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/chat'); // to Chat
          } else if (index == 1) {
            Navigator.pushReplacementNamed(context, '/friends');
          } else if (index == 2) {
            // Already on settings
          } else if (index == 3) {
            Navigator.pushReplacementNamed(context, '/exploreEcomerce');
          }
        },
      ),

    );
  }
}

class _SettingsItem extends StatelessWidget {
  final String title;
  final bool isLogout;
  final bool isProjects;
  final bool isEcomerce;
  final bool isEvent;
  final bool isMap;
  final bool isSearch;
  final bool isFeedback;

  const _SettingsItem({required this.title,
   this.isLogout = false,
    this.isProjects = false,
    this.isEcomerce = false,
    this.isEvent = false,
    this.isMap = false,
    this.isSearch = false,
    this.isFeedback = false,
   });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: AppColors.lightGrey),
      onTap: () {
        if (isLogout){
          _showLogoutDialog(context);
        
        } else if (isProjects) {
          Navigator.pushNamed(context, '/projects');

        } else if (isEcomerce) {
          Navigator.pushNamed(context, '/exploreEcomerce');
      
        } else if (isEvent) {
          Navigator.pushNamed(context, '/event');
        
        } else if (isMap) {
          Navigator.pushNamed(context, '/map');

        } else if (isSearch) {
          Navigator.pushNamed(context, '/search');

        } else if (isFeedback) {
          Navigator.pushNamed(context, '/feedback');
        }
      },
    );
  }
  void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24),
      actionsPadding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      title: const Text(
        'Log out',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: 'Inter',
          fontSize: 18,
        ),
        textAlign: TextAlign.center
      ),
      content: const Text(
        "Are you sure you want to log out? You’ll need to login again to use the app.",
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          color: AppColors.black,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: SecondaryButton(
                  text: 'Cancel',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  text: 'Log out',
                  onPressed: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, '/onboarding');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}