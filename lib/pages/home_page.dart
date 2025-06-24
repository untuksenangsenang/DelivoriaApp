import 'package:delivoria/components/my_current_location.dart';
import 'package:delivoria/components/my_description_box.dart';
import 'package:delivoria/components/my_drawer.dart';
import 'package:delivoria/components/my_silver_app_bar.dart';
import 'package:delivoria/components/my_tab_bar.dart';
import 'package:delivoria/models/food.dart';
import 'package:delivoria/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  //tab controller
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

  // sort out and return the list of food items that belong to a specific category
  List<Food> _filterFoodsByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodsInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterFoodsByCategory(category, fullMenu);
      
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categoryMenu[index].name),
          );
        },
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController,), child: Column(
            children: [

              Divider( indent: 25, endIndent: 25, color: Theme.of(context).colorScheme.secondary,),

              //my curent location
              const MyCurrentLocation(),

              //description box
              const MyDescriptionBox(),
            ],
          )),
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