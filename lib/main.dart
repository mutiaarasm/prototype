import 'package:flutter/material.dart';
import 'package:prototype/screens/chat.dart';
import 'package:prototype/screens/onboarding.dart';
import 'package:prototype/screens/project.dart';
import 'package:prototype/screens/roomChat.dart';
import 'package:prototype/screens/personalize.dart';
import 'package:prototype/screens/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/chat': (context) => const ChatScreen(),
        '/roomchat': (context) => const RoomChatScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/projects': (context) => const ProjectsScreen(),
      },
    );
  }
}
