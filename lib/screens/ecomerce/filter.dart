import 'package:flutter/material.dart';
import 'package:prototype/constants/app_colors.dart';
import 'package:prototype/widgets/primary_button.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> selectedCategories = [];
  RangeValues selectedRange = const RangeValues(20, 80);
  List<String> selectedColors = [];
  List<String> selectedSizes = [];
  List<String> selectedRatings = [];

  Map<String, bool> isExpanded = {
    'Category': true,
    'Price Range': false,
    'Color': false,
    'Size': false,
    'Customer Review': false,
  };

  final categories = ['Shoes', 'T-shirt'];
  final colors = [
    'BLACK', 'WHITE', 'GREY', 'YELLOW', 'BLUE',
    'PURPLE', 'GREEN', 'RED', 'PINK', 'ORANGE', 'GOLD', 'SILVER',
  ];
  final sizes = ['S', 'M', 'L', 'XL'];
  final ratings = ['4.0+ Stars', '4.5+ Stars', '5.0+ Stars'];

  void toggleSelection(List<String> list, String value) {
    setState(() {
      list.contains(value) ? list.remove(value) : list.add(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 16), // << Tambah top padding besar
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      color: AppColors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900,
                    color: AppColors.black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategories.clear();
                      selectedColors.clear();
                      selectedSizes.clear();
                      selectedRatings.clear();
                      selectedRange = const RangeValues(20, 80);
                    });
                  },
                  child: const Text(
                    'Clear All',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                children: [
                  _buildExpandable(
                    'Category',
                    count: selectedCategories.length,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: categories.map((cat) {
                        final selected = selectedCategories.contains(cat);
                        return FilterChip(
                          label: Text(
                            cat,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          selected: selected,
                          selectedColor: AppColors.blue,
                          backgroundColor: AppColors.neutralblue,
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (_) => toggleSelection(selectedCategories, cat),
                        );
                      }).toList(),
                    ),
                  ),
                  _buildExpandable(
                    'Price Range',
                    child: Column(
                      children: [
                        RangeSlider(
                          values: selectedRange,
                          min: 0,
                          max: 100,
                          divisions: 10,
                          activeColor: AppColors.blue,
                          labels: RangeLabels(
                            '€ ${selectedRange.start.toInt()}',
                            '€ ${selectedRange.end.toInt()}',
                          ),
                          onChanged: (values) => setState(() => selectedRange = values),
                        ),
                      ],
                    ),
                  ),
                  _buildExpandable(
                    'Color',
                    count: selectedColors.length,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: colors.map((color) {
                        final selected = selectedColors.contains(color);
                        return FilterChip(
                          label: Text(
                            color,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          selected: selected,
                          selectedColor: AppColors.blue,
                          backgroundColor: AppColors.neutralblue,
                          showCheckmark: false,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (_) => toggleSelection(selectedColors, color),
                        );
                      }).toList(),
                    ),
                  ),
                  _buildExpandable(
                    'Size',
                    count: selectedSizes.length,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: sizes.map((size) {
                        final selected = selectedSizes.contains(size);
                        return ChoiceChip(
                          label: Text(
                            size,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          selected: selected,
                          selectedColor: AppColors.blue,
                          backgroundColor: AppColors.neutralblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (_) => toggleSelection(selectedSizes, size),
                        );
                      }).toList(),
                    ),
                  ),
                  _buildExpandable(
                    'Customer Review',
                    count: selectedRatings.length,
                    child: Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: ratings.map((rating) {
                        final selected = selectedRatings.contains(rating);
                        return ChoiceChip(
                          label: Text(
                            rating,
                            style: TextStyle(
                              color: selected ? Colors.white : AppColors.blue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          selected: selected,
                          selectedColor: AppColors.blue,
                          backgroundColor: AppColors.neutralblue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onSelected: (_) => toggleSelection(selectedRatings, rating),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(height: 32),
                  PrimaryButton(
                    text: "Apply Filters",
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandable(String title, {required Widget child, int count = 0}) {
    final expanded = isExpanded[title] ?? false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () => setState(() => isExpanded[title] = !expanded),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              Row(
                children: [
                  if (count > 0)
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '$count',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Icon(
                    expanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.black,
                  ),
                ],
              ),
            ],
          ),
        ),
        if (expanded) const SizedBox(height: 12),
        if (expanded) child,
      ],
    );
  }
}
