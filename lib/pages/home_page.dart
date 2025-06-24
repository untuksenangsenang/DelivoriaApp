import 'package:delivoria/components/my_current_location.dart';
import 'package:delivoria/components/my_description_box.dart';
import 'package:delivoria/components/my_drawer.dart';
import 'package:delivoria/components/my_silver_app_bar.dart';
import 'package:delivoria/components/my_tab_bar.dart';
import 'package:flutter/material.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
        body: TabBarView(
          controller: _tabController,
          children: [
          ListView.builder (
            itemCount:5,
             itemBuilder: (context, index) => Text("First"),
             ),
          ListView.builder (
            itemCount:5,
             itemBuilder: (context, index) => Text("second"),
             ),
          ListView.builder (
            itemCount:5,
             itemBuilder: (context, index) => Text("third"),
             ),
        ])
      ),
    );
  }
}