import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_navbar.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> chats = [
      {'name': 'Haley James', 'message': 'Stand up for what you believe in', 'unread': 9},
      {'name': 'Nathan Scott', 'message': 'One day you\'re seventeen...', 'unread': 0},
      {'name': 'Brooke Davis', 'message': 'I am who I am. No excuses.', 'unread': 2},
      {'name': 'Jamie Scott', 'message': 'Some people are a little different.', 'unread': 0},
      {'name': 'Marvin McFadden', 'message': 'Last night in the NBA...', 'unread': 0},
      {'name': 'Antwon Taylor', 'message': 'Meet me at the Rivercourt', 'unread': 0},
      {'name': 'Jake Jagielski', 'message': 'You\'re gonna go to some great places...', 'unread': 0},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Edit',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.blue,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Chats',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Icon(Icons.edit_square, size: 25, color: AppColors.blue),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                  ),
                  prefixIcon: const Icon(Icons.search, color: AppColors.black),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  fillColor: AppColors.neutralblue,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Chat List
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/roomchat');
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Icon(Icons.person, size: 24, color: AppColors.lightestblue),
                    ),
                    title: Text(
                      chat['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'Inter',
                      ),
                    ),
                    subtitle: Text(
                      chat['message'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    trailing: chat['unread'] > 0
                        ? Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: AppColors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              chat['unread'].toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navbar
      bottomNavigationBar: BottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) return;
          if (index == 1) {
            Navigator.pushReplacementNamed(context, '/friends');
          } else if (index == 2) {
            Navigator.pushReplacementNamed(context, '/settings');
          }
        },
      ),
    );
  }
}
