import 'package:flutter/material.dart';
import 'package:prototype/constants/app_colors.dart';
import 'package:prototype/widgets/primary_button.dart';
import 'personalize.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> imageSlides = List.generate(
    3,
    (index) => Container(
      width: double.infinity,
      color: AppColors.lightBlueBg,
      child: const Center(
        child: Icon(Icons.image, size: 50, color: AppColors.lightestblue),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Slide
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.55,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: imageSlides.length,
                itemBuilder: (context, index) => imageSlides[index],
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dot 
                    Row(
                      children: List.generate(
                        imageSlides.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(right: 8),
                          width: _currentPage == index ? 12 : 6,
                          height: _currentPage == index ? 12 : 6,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? AppColors.blue
                                : const Color(0xFFD0D5DD),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),

                    // Title & Description
                    const Text(
                      'Create a prototype in just a few minutes',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'Enjoy these pre-made components and worry only\nabout creating the best product ever.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.lightGrey,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                      ),
                    ),

                    PrimaryButton(
                      text: 'Next',
                      onPressed: () {
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
}
