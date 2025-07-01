import 'package:delivoria/components/my_current_location.dart';
import 'package:delivoria/components/my_description_box.dart';
import 'package:delivoria/components/my_drawer.dart';
import 'package:delivoria/components/my_food_tile.dart';
import 'package:delivoria/components/my_silver_app_bar.dart';
import 'package:delivoria/components/my_tab_bar.dart';
import 'package:delivoria/models/food.dart';
import 'package:delivoria/models/restaurant.dart';
import 'package:delivoria/pages/food_page.dart';
import 'package:delivoria/pages/delivobot_page.dart'; // ⬅️ Tambahkan ini
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Food> _filterFoodsByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodsInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterFoodsByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodPage(food: food),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const DelivoBotPage()),
          );
        },
        label: const Text("DelivoBot"),
        icon: const Icon(Icons.smart_toy_rounded),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLocation(),
                const MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodsInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
