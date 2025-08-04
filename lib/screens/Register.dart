import 'package:flutter/material.dart';
import 'package:prototype/screens/confirmation.dart';
import '../constants/app_colors.dart';
import '../widgets/primary_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 16),
            const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                fontFamily: 'Inter',
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Create an account to get started',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.lightGrey,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 24),

            // Name
            const Text('Name', style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              fontSize: 16,
              color: AppColors.black
              )),
            const SizedBox(height: 6),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Your name',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),

            const SizedBox(height: 16),

            // Email
            const Text('Email Address', style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              fontSize: 16,
              color: AppColors.black
              )),
            const SizedBox(height: 6),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'name@email.com',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
            ),

            const SizedBox(height: 16),

            // Password
            const Text('Password', style: TextStyle(
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
              fontSize: 16,
              color: AppColors.black
              )),
            const SizedBox(height: 6),
            TextField(
              controller: passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: 'Create a password',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12)
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Confirm Password
            TextField(
              controller: confirmPasswordController,
              obscureText: !confirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                  focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12)
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      confirmPasswordVisible = !confirmPasswordVisible;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Terms & Conditions
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Transform.scale(
                  scale: 1.6,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: const BorderSide(
                      color: AppColors.lightGrey,
                      width: 1.1,
                    ),
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                      (Set<WidgetState> states) {
                        if (states.contains(WidgetState.selected)) {
                          return AppColors.blue; // biru saat dicentang
                        } 
                        return Colors.white; // putih saat kosong
                      },
                    ),
                    checkColor: Colors.white, // centang putih
                  ),
                ),
              
              const SizedBox(width: 6),
              Expanded(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      color: AppColors.lightGrey,
                      fontWeight: FontWeight.w400
                    ),
                    children: [
                      TextSpan(text: 'I\'ve read and agree with the '),
                      TextSpan(
                        text: 'Terms and Conditions',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(text: ' and the '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Inter',
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
              ),
            ],
          ),

            const SizedBox(height: 24),

            // Register button
            PrimaryButton(
              text: 'Sign up',
              onPressed: () {
                //print('Registering...');
                Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ConfirmationScreen()),
                            );
              },
            ),
          ],
        ),
      ),
    );
  }
}
