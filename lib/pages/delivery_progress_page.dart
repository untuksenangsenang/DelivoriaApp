import 'package:flutter/material.dart';
import 'package:delivoria/components/my_receipt.dart';

class DeliveryProgressPage extends StatelessWidget {
  const DeliveryProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delivery in Progress",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: MyReceipt(),
        ),
      ),
    );
  }

  // Simplified bottom nav bar - driver profile, details, message/call buttons
  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      height: 80,
      color: Theme.of(context).colorScheme.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Driver profile and details
          Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 28,
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Aufa Dzaki",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  Text(
                    "Driver",
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Message and call buttons
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.message, size: 24),
                color: Theme.of(context).colorScheme.inversePrimary,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.call, size: 24),
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}