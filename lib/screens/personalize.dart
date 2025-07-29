import 'package:flutter/material.dart';
import 'package:prototype/screens/onboarding.dart';
import 'package:prototype/screens/subscribe.dart';
import 'package:prototype/widgets/chekbox.dart';
import 'package:prototype/widgets/progress_bar.dart';
import '../constants/app_colors.dart';
import '../widgets/primary_button.dart';

class PersonalizeScreen extends StatefulWidget {
  const PersonalizeScreen({super.key});

  @override
  State<PersonalizeScreen> createState() => _PersonalizeScreenState();
}

class _PersonalizeScreenState extends State<PersonalizeScreen> {
  final List<String> interests = [
    'User Interface',
    'User Experience',
    'User Research',
    'UX Writing',
    'User Testing',
    'Service Design',
    'Strategy',
    'Design Systems',
  ];

  final Set<String> selectedInterests = {};

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
              const ProgressBar(progress: 0.4), 
              const SizedBox(height: 40),
              const Text(
                'Personalise your experience',
                style: TextStyle(
                  fontSize: 30, 
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Inter'
                  ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose your interests.',
                style: TextStyle(
                  fontSize: 18, 
                  color: AppColors.lightGrey,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: interests.map((item) {
                    final selected = selectedInterests.contains(item);
                    return InterestCheckbox(
                      title: item,
                      isSelected: selected,
                      onTap: () {
                        setState(() {
                          if (selected) {
                            selectedInterests.remove(item);
                          } else {
                            selectedInterests.add(item);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Next',
                onPressed: () {
                  print('Selected: $selectedInterests');

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SubscriptionScreen()),
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
