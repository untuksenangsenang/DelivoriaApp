import 'package:flutter/material.dart';
import '../models/food.dart';


class QuantitySelector extends StatelessWidget {
  final int quantity;
  final Food food;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;


  const QuantitySelector({
    super.key,
    required this.quantity,
    required this.food,
    required this.onIncrement,
    required this.onDecrement
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(50)
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          //decrase button
          GestureDetector(
            onTap: onDecrement,
            child: Icon(
              Icons.remove,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          //quantity count
          Padding(padding: 
          EdgeInsets.symmetric(horizontal: 8),
          child: SizedBox(
            width: 20,
            child: Center(
              child: Text(
                quantity.toString(),
              ),
            ),
          ),
        ),

          //increase button
          GestureDetector(
            onTap: onIncrement,
            child: Icon(
              Icons.add,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }
}