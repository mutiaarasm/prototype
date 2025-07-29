import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/primary_button.dart';
import '../widgets/socialButton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            const SizedBox(height: 16),
            // Gambar
            Container(
              height: MediaQuery.of(context).size.height * 0.30, 
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBlueBg,
              ),
              child: const Center(
                child: Icon(
                  Icons.image,
                  size: 48,
                  color: Colors.grey,
                ),
              ),
            ),


            const SizedBox(height: 32),

            const Text(
              'Welcome!',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 24),

            // Email Field
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email Address',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Password Field
            TextField(
              controller: passwordController,
              obscureText: !passwordVisible,
              decoration: InputDecoration(
                hintText: 'Password',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
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

            const SizedBox(height: 12),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot password?',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Inter',
                    color: AppColors.blue,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Login Button
            PrimaryButton(
              text: 'Login',
              onPressed: () {
                print('Login: ${emailController.text}');
              },
            ),

            const SizedBox(height: 16),

            // Register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Not a member?',
                  style: TextStyle(fontSize: 14, fontFamily: 'Inter'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Register now',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),

            const Divider(height: 40),

            const Center(
              child: Text(
                'Or continue with',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.lightGrey,
                  fontFamily: 'Inter',
                ),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialButton(icon: Icons.g_mobiledata, color: Colors.red),
                SizedBox(width: 16),
                SocialButton(icon: Icons.apple, color: Colors.black),
                SizedBox(width: 16),
                SocialButton(icon: Icons.facebook, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
