import 'package:flutter/material.dart';
import 'package:prototype/screens/chat.dart';
import 'package:prototype/screens/event/event.dart';
import 'package:prototype/screens/ecomerce/explore_ecomerce.dart';
import 'package:prototype/screens/map/map.dart';
import 'package:prototype/screens/onboarding.dart';
import 'package:prototype/screens/projects/project.dart';
import 'package:prototype/screens/room_chat.dart';
import 'package:prototype/screens/search/search.dart';
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
        '/exploreEcomerce': (context) => const ExploreEcomerce(),
        '/event': (context) => const EventsScreen(),
        '/search': (context) => const SearchScreen(),
        '/map': (context) => const MapScreen(),

      },
    );
  }
}
