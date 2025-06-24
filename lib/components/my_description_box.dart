import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    // text styles
    var myPrimaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
      fontWeight: FontWeight.bold, // Menambah kejelasan pada teks utama
    );

    var mySecondaryTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
      fontSize: 12, // Ukuran font lebih kecil untuk teks sekunder
    );

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(15), // Mengurangi padding untuk ruang yang lebih hemat
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // Memastikan vertikal alignment
        children: [
          // delivery fee
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk teks
            children: [
              Text('\$0.99', style: myPrimaryTextStyle),
              Text('Delivery Fee', style: mySecondaryTextStyle),
            ],
          ),
          // delivery time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Rata kiri untuk teks
            children: [
              Text('15-30 min', style: myPrimaryTextStyle),
              Text('Delivery time', style: mySecondaryTextStyle),
            ],
          ),
        ],
      ),
    );
  }
}