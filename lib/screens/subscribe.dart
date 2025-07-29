import 'package:flutter/material.dart';
import 'package:prototype/screens/login.dart';
import '../constants/app_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/subscribeplan.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  String selectedPlan = 'Yearly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Choose your\nsubscription plan',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'And get a 7-day free trial',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightGrey,
                ),
              ),
              const SizedBox(height: 35),

              // Plan options
              SubscriptionPlan(
                title: 'Yearly',
                price: '€ 94.80',
                discount: '-66% discount',
                note: 'every year',
                isSelected: selectedPlan == 'Yearly',
                onTap: () {
                  setState(() {
                    selectedPlan = 'Yearly';
                  });
                },
                showStar: true,
              ),
              const SizedBox(height: 12),
              SubscriptionPlan(
                title: 'Monthly',
                price: '€ 10.90',
                discount: '-53% discount',
                note: 'every month',
                isSelected: selectedPlan == 'Monthly',
                onTap: () {
                  setState(() {
                    selectedPlan = 'Monthly';
                  });
                },
              ),
              const SizedBox(height: 12),
              SubscriptionPlan(
                title: 'Weekly',
                price: '€ 5.90',
                discount: '',
                note: 'every week',
                isSelected: selectedPlan == 'Weekly',
                onTap: () {
                  setState(() {
                    selectedPlan = 'Weekly';
                  });
                },
              ),

              const SizedBox(height: 30),

              // tampilkan benefitnya
              if (selectedPlan == 'Yearly') ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.neutralblue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You'll Get:",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.black,
                          ),
                      ),

                      _FeatureItem(text: 'Unlimited access'),
                      _FeatureItem(text: '200GB storage'),
                      _FeatureItem(text: 'Sync all your devices'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],

              const Spacer(),

              PrimaryButton(
                text: 'Subscribe',
                onPressed: () {
                  print('Selected plan: $selectedPlan');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;
  const _FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.star, size: 16, color: AppColors.blue),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
