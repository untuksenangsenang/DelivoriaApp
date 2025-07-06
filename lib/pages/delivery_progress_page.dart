import 'package:flutter/material.dart';
import 'package:delivoria/components/my_receipt.dart';
import 'package:delivoria/services/database/firestore.dart';
import 'package:provider/provider.dart';
import 'package:delivoria/models/restaurant.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  final FirestoreService db = FirestoreService();
  bool _isExpanded = false;

  String? latestFoodName;
  String latestStatus = "paid";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final receipt = context.read<Restaurant>().displayCartReceipt();
      final firstItem = context.read<Restaurant>().cart.isNotEmpty
          ? context.read<Restaurant>().cart.first.food.name
          : "Pesanan";

      db.saveOrderToDatabase(receipt).then((_) {
        setState(() {
          latestFoodName = firstItem;
          latestStatus = "paid";
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delivery Progress",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: MyReceipt(),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            bottom: _isExpanded ? 0 : -MediaQuery.of(context).size.height * 0.6 + 100,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Material(
                elevation: 12,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                color: Theme.of(context).colorScheme.secondary,
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Aufa Dzaki (Driver)",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: latestFoodName == null
                            ? const Center(child: CircularProgressIndicator())
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Pesanan: $latestFoodName",
                                      style: const TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 4),
                                  Text("Status: $latestStatus",
                                      style: const TextStyle(fontSize: 14)),
                                  const SizedBox(height: 16),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        radius: 24,
                                        backgroundImage:
                                            AssetImage('lib/images/driver.png'),
                                      ),
                                      const SizedBox(width: 12),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Aufa Dzaki",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold)),
                                            Text("Driver Anda",
                                                style: TextStyle(
                                                    fontSize: 12, color: Colors.grey)),
                                          ],
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.message),
                                        onPressed: () {
                                          // aksi kirim pesan
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.phone),
                                        onPressed: () {
                                          // aksi panggilan
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
