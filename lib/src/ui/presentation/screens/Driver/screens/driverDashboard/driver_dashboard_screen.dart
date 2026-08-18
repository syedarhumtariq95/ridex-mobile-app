import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_bottom_navbar_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_earnings_card_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_online_status_widget.dart';
import '../driverProfileScreen/driver_profile_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_overview_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/earnings/earnings_screen.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  bool isOnline = true;
  int selectedNavIndex = 0;

  /// Home Tab Body Content
  Widget _buildHomeBody() {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 0.02.sh),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  /// Online Toggle Switch Tile
                  DriverOnlineStatusWidget(
                    isOnline: isOnline,
                    onStatusChanged: (value) {
                      setState(() {
                        isOnline = value;
                      });
                    },
                  ),

                  SizedBox(height: 0.050.sh),

                  /// Today's Earnings Card
                  DriverEarningsCardWidget(earnings: '2,450', totalRides: 5),

                  SizedBox(height: 0.050.sh),

                  /// Today's Overview Section
                  DriverOverviewWidget(timeOnline: '4h 30m', totalTrips: 5),

                  SizedBox(height: 0.02.sh),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Pages list linked with Navbar Tabs
    final List<Widget> pages = [
      _buildHomeBody(),
      const SafeArea(child: EarningsScreen()),
      const DriverProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        children: [
          /// Selected Tab Screen View
          Expanded(child: pages[selectedNavIndex]),

          /// Custom Bottom Navbar with bottom-only SafeArea protection
          SafeArea(
            top: false,
            child: DriverBottomNavbarWidget(
              selectedIndex: selectedNavIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedNavIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
