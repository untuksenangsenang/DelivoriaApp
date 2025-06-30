import 'package:delivoria/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController,
  });

  // Build category tabs with capitalized text
  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      // Capitalize the first letter (e.g., "pizza" -> "Pizza")
      String categoryName = category.toString().split('.').last;
      categoryName = categoryName[0].toUpperCase() + categoryName.substring(1);
      return Tab(
        text: categoryName,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8), // White with slight opacity
        borderRadius: BorderRadius.circular(10),
      ),
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(),
        labelColor: Theme.of(context).colorScheme.primary,
        unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        indicatorColor: Theme.of(context).colorScheme.primary,
        labelPadding: const EdgeInsets.symmetric(horizontal: 12),
        labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
      ),
    );
  }
}