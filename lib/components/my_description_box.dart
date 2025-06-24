import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.onBackground,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    final mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 12,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery Fee
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('\$0.99', style: myPrimaryTextStyle),
                const SizedBox(height: 4),
                Text('Delivery Fee', style: mySecondaryTextStyle),
              ],
            ),
          ),

          // Delivery Time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('15–30 min', style: myPrimaryTextStyle),
                const SizedBox(height: 4),
                Text('Delivery time', style: mySecondaryTextStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
