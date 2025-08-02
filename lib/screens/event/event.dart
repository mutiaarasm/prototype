import 'package:flutter/material.dart';
import 'package:prototype/widgets/event_category.dart';
import '../../constants/app_colors.dart';
import '../../widgets/event_card.dart';
import '../../widgets/event_tile.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 24),

            // Search icon
            const Align(
              alignment: Alignment.centerLeft,
              child: Icon(Icons.search, color: AppColors.black),
            ),
            const SizedBox(height: 24),

            // 🟦 Filter Tabs
            const CategoryTabs(),
            const SizedBox(height: 24),

            // 📍 Near you section
            _buildSectionHeader('Near you'),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  EventCard(
                    name: 'Maroon 5',
                    location: 'Recife, Brazil',
                    date: 'MAR 05',
                  ),
                  EventCard(
                    name: 'Alicia Keys',
                    location: 'Olinda, Brazil',
                    date: 'MAR 05',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            //  Your events
            _buildSectionHeader('Your events', showMore: false),
            const SizedBox(height: 16),
            const EventTile(title: 'Alicia Keys', subtitle: 'Olinda, Brazil'),
            const EventTile(title: 'Michael Jackson', subtitle: 'Recife, Brazil'),

            const SizedBox(height: 32),

            //  Selling out
            _buildSectionHeader('Selling out'),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  EventCard(
                    name: 'Alicia Keys',
                    location: 'Recife, Brazil',
                    date: 'MAR 05',
                  ),
                  EventCard(
                    name: 'Maroon 5',
                    location: 'Olinda, Brazil',
                    date: 'MAR 05',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {bool showMore = true}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            fontFamily: 'Inter',
          ),
        ),
        if (showMore)
          const Text(
            'See more',
            style: TextStyle(
              color: AppColors.blue,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
      ],
    );
  }
}
