import 'package:delivoria/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 10), // Tambah bottom untuk konsistensi
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Mengatur jarak antara teks dan switch
              children: [
                // dark mode switch
                Text(
                  "Dark Mode",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode, // Perbaiki akses properti
                  onChanged: (value) => Provider.of<ThemeProvider>(context, listen: false).toogleTheme(), // Perbaiki sintaksis
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}