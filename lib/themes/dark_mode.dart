import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF1E1E1E),         // Permukaan utama (misal card, background section)
    primary: const Color(0xFF64B5F6),         // Biru terang untuk elemen utama (tombol, ikon aktif)
    secondary: const Color(0xFF2C2C2C),       // Warna latar kontras sedang
    tertiary: const Color(0xFF37474F),        // Aksen gelap untuk kedalaman
    inversePrimary: const Color(0xFF90CAF9),  // Biru muda untuk teks di atas primary
  ),
);
