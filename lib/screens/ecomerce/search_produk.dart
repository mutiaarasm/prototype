import 'package:flutter/material.dart';
import 'package:prototype/constants/app_colors.dart';
import 'package:prototype/screens/ecomerce/search_result.dart';

class SearchProductPage extends StatefulWidget {
  const SearchProductPage({super.key});

  @override
  State<SearchProductPage> createState() => _SearchProductPageState();
}

class _SearchProductPageState extends State<SearchProductPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> recentSearches = ['Shoes', 'Jacket', 'Pants'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: TextField(
          controller: _controller,
          autofocus: true,
          onChanged: (value) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchResultPage(initialQuery: value),
              ),
            );
          },
          decoration: InputDecoration(
            hintText: 'Search...',
            filled: true,
            fillColor: AppColors.lightBlueBg,
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'RECENT SEARCHES',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.lightGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            ...recentSearches.map(
              (item) => ListTile(
                title: Text(item),
                trailing: const Icon(Icons.close, size: 18),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchResultPage(initialQuery: item),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

