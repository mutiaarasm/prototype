import 'package:flutter/material.dart';
import 'package:prototype/constants/app_colors.dart';
import 'package:prototype/widgets/secondary_button.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({super.key});

  @override
  Widget build(BuildContext context) {
    final double cardHeight = MediaQuery.of(context).size.height * 0.56;

    return Container(
      height: cardHeight,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full-width Image Area
            Container(
              width: double.infinity,
              height: 140,
              decoration: const BoxDecoration(
                color: AppColors.neutralblue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              child: const Center(
                child: Icon(Icons.image,
                    size: 40, color: AppColors.lightestblue),
              ),
            ),

            const SizedBox(height: 8),

            // Dots indicator
            const Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, size: 6, color: AppColors.blue),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 6, color: AppColors.neutralblue),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 6, color: AppColors.neutralblue),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Text Info
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Great Apartment',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: 
                      FontWeight.w800,
                      color: AppColors.black
                      ),
                  ),
                  const Text(
                    '€ 150.00',
                    style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily:'Inter',
                    color: AppColors.lightGrey
                    ),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'ABOUT',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Perfect flat for 4 people. Peaceful and good location, close to bus stops and many restaurants.',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),

                  const Text(
                    'HOSTED BY',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Host Row
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.neutralblue,
                        child: Icon(Icons.person,
                            size: 18, color: AppColors.lightestblue),
                      ),
                      SizedBox(width: 8),
                      Text('Karen Roe',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      SizedBox(width: 8),
                      Icon(Icons.star, color: AppColors.blue, size: 16),
                      Text('4.8',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: SecondaryButton(
                      text: 'See details',
                      onPressed: () {
                        // action
                      },
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
