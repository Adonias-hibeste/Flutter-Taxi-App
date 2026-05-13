import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'ride_selection_page.dart';

class TaxiHomePage extends StatelessWidget {
  const TaxiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Simulated Map Background
          _buildMapBackground(),
          
          // Header
          _buildHeader(),
          
          // Bottom Search Card
          _buildSearchCard(context),
          
          // Floating Action Buttons
          _buildFloatingButtons(),
        ],
      ),
    );
  }

  Widget _buildMapBackground() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        image: DecorationImage(
          image: const NetworkImage('https://images.unsplash.com/photo-1526649661456-89c7ed4d00fb'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
        ),
      ),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // User Location
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(color: Colors.yellow, shape: BoxShape.circle, border: Border.all(color: Colors.black, width: 3)),
            ),
            // Simulated Cars
            _buildCarMarker(const Offset(100, 200)),
            _buildCarMarker(const Offset(-120, -150)),
            _buildCarMarker(const Offset(50, -250)),
          ],
        ),
      ),
    );
  }

  Widget _buildCarMarker(Offset offset) {
    return Transform.translate(
      offset: offset,
      child: const Icon(LucideIcons.car, color: Colors.yellow, size: 32),
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
              child: const Icon(LucideIcons.menu, color: Colors.yellow),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: const [
                  CircleAvatar(radius: 4, backgroundColor: Colors.yellow),
                  SizedBox(width: 8),
                  Text('Online', style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchCard(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Where to?', style: TextStyle(color: Colors.yellow, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RideSelectionPage())),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: const Color(0xFF1A1A1A), borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: const [
                    Icon(LucideIcons.search, color: Colors.yellow),
                    SizedBox(width: 16),
                    Text('Search destination...', style: TextStyle(color: Colors.white54)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Recent Places', style: TextStyle(color: Colors.white38, fontSize: 12, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildRecentPlace('Elite Store', 'High-end District • 2.4 km'),
            _buildRecentPlace('Urban Office', 'Downtown Hub • 5.1 km'),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentPlace(String title, String sub) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          const Icon(LucideIcons.mapPin, color: Colors.white24, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(sub, style: const TextStyle(color: Colors.white38, fontSize: 12)),
              ],
            ),
          ),
          const Icon(LucideIcons.chevronRight, color: Colors.white24, size: 16),
        ],
      ),
    );
  }

  Widget _buildFloatingButtons() {
    return Positioned(
      right: 16,
      bottom: 300,
      child: Column(
        children: [
          _buildFab(LucideIcons.navigation2),
          const SizedBox(height: 12),
          _buildFab(LucideIcons.shieldCheck),
        ],
      ),
    );
  }

  Widget _buildFab(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(color: Colors.yellow, shape: BoxShape.circle),
      child: Icon(icon, color: Colors.black),
    );
  }
}
