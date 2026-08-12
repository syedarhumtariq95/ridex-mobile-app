import 'package:flutter/material.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/home/widgets/home_map_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/home/widgets/recent_places_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/home/widgets/saved_places_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Map + Top Buttons + Where To
            HomeMapWidget(),

            /// Saved Places
            SavedPlacesWidget(),

            /// Recent Places
            RecentPlacesWidget(),
          ],
        ),
      ),
    );
  }
}