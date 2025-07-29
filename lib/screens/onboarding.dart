import 'package:flutter/material.dart';
import 'package:prototype/widgets/primary_button.dart';
import '../constants/app_colors.dart';
import 'personalize.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
              width: double.infinity,
              color:  AppColors.lightBlueBg,
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 50,
                  color: AppColors.lightGrey,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // slide dot
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _buildDot(isActive: true),
                        const SizedBox(width: 6),
                        _buildDot(),
                        const SizedBox(width: 6),
                        _buildDot(),
                      ],
                    ),

                    // Title & Deskripsi
                    Column(
                      children: const [
                        Text(
                          'Create a prototype in just a few minutes',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            color: AppColors.black
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Enjoy these pre-made components and worry only\nabout creating the best product ever.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.lightGrey,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    PrimaryButton(text: 'Next', 
                    onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PersonalizeScreen()),
                    );
                    },
                    ),

                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dot Builder
  static Widget _buildDot({bool isActive = false}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF007AFF) : const Color(0xFFE0E0E0),
        shape: BoxShape.circle,
      ),
    );
  }
}
