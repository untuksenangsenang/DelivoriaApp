import 'package:delivoria/models/food.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {

  final TabController tabController;

  const MyTabBar({super.key,
    required this.tabController,
  });

// Example method for building category tabs (currently unused)
List<Tab> _buildCategoryTabs(List<String> categories) {
  return FoodCategory.values.map((category) {
    return Tab(
      text: category.toString().split('.').last,
    );
  }).toList();
}

@override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: _buildCategoryTabs(FoodCategory.values.map((category) => category.toString().split('.').last).toList()),
      ),
    );
  }
}