import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/pages/taxi_home_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TaxiApp(),
    ),
  );
}

class TaxiApp extends StatelessWidget {
  const TaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taxi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFF7C325),
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(ThemeData.light().textTheme),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF7C325),
          primary: const Color(0xFF1A1A1A),
          secondary: const Color(0xFFF7C325),
        ),
        useMaterial3: true,
      ),
      home: const TaxiHomePage(),
    );
  }
}
