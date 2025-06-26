import 'package:delivoria/models/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delivoria/components/my_cart_tile.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold ui
        return Scaffold(
          appBar: AppBar(
            title:const Text("Cart"),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart
            IconButton(
              onPressed: (){
                showDialog(context: context, builder: (context) => AlertDialog(
                  title: Text("Are u want to clear the cart"),
                  actions: [
                    //cancel button
                    TextButton(onPressed: () => Navigator.pop(context), 
                    child: const Text("Cancel")
                    ),

                    //yes button
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                      restaurant.clearCart();
                    }, 
                    child: const Text("Yes"))
                  ],
                )
                );
              }, icon: const Icon(Icons.delete),)
          ],
          ),
          body: Column(
            children: [

              //list of cart
              Column(
                children: [
                  userCart.isEmpty 
                  ? const Expanded (child: Center(child: const Text("Cart Is Empty.....")))
                  : Expanded(
                    child: ListView.builder(
                      itemCount: userCart.length,
                      itemBuilder: (context, index) {
                        //get individual cart item
                        final cartItem = userCart[index];
              
                        //return cart tile ui
                        return MyCartTile(cartItem: cartItem);
                      }))
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}