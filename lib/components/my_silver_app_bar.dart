import 'package:delivoria/pages/cart_page.dart';
import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySilverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // cart button
        IconButton(
          onPressed: () {
            //go to cart page 
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const CartPage(),)
              );
          }, // Fungsi kosong atau ganti dengan logika yang diinginkan
          icon: Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Sunset Dinner"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 0, left: 0, right: 0, top: 0),
        expandedTitleScale:  1,
      ),
    );
  }
}