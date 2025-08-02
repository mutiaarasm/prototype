import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:prototype/constants/app_colors.dart';
import 'package:prototype/widgets/property_card_map.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool showPropertyInfo = false;

  final LatLng _center = LatLng(-8.0476, -34.8770); // Recife

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFFF6F7F9), // abu background
    body: Stack(
      children: [
        // 🗺️ PETA
        Padding(
          padding: const EdgeInsets.only(top: 100), // supaya tidak nutupi header
          child: FlutterMap(
            options: MapOptions(
              center: _center,
              zoom: 13,
              onTap: (_, __) {
                setState(() => showPropertyInfo = false);
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                subdomains: const ['a', 'b', 'c', 'd'],
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(-8.0456, -34.8800),
                    width: 40,
                    height: 40,
                    child: GestureDetector(
                      onTap: () {
                        setState(() => showPropertyInfo = true);
                      },
                      child: const Icon(
                        Icons.place,
                        color: AppColors.blue,
                        size: 36,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // 📌 HEADER
        SafeArea(
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 🔙 Back Icon
        const Icon(
          Icons.arrow_back_ios,
          size: 18,
          color: AppColors.blue,
        ),

        const SizedBox(width: 16), // jarak kiri

        // 📍 Title + Subtitle di tengah dengan Expanded
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Recife',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Mar 12 – Mar 15',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),

        // 📦 Text kanan
        const Text(
          '291 results',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
      ],
    ),
  ),
),


        // 🧾 PROPERTY CARD
        if (showPropertyInfo)
          Align(
            alignment: Alignment.bottomCenter,
            child: const PropertyCard(),
          ),
      ],
    ),
  );
}
}
