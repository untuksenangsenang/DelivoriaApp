import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade100,         // Retained: Light grey for a fresh background
    primary: Colors.blue.shade500,         // Changed to a bolder, more vibrant blue for primary elements
    secondary: Colors.teal.shade200,       // Retained: Soft teal for contrast
    tertiary: Colors.white,                // Retained: Pure white for clean accents
    inversePrimary: Colors.blue.shade800,  // Changed to a deeper blue for better contrast on white
  ),
);