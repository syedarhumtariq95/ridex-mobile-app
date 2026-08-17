import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_bottom_navbar_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_earnings_card_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_online_status_widget.dart';
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
    return Column(
      children: [
        SizedBox(height: 0.06.sh),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
            physics: BouncingScrollPhysics(),
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
                DriverEarningsCardWidget(
                  earnings: '2,450',
                  totalRides: 5,
                ),

                SizedBox(height: 0.050.sh),

                /// Today's Overview Section
                DriverOverviewWidget(
                  timeOnline: '4h 30m',
                  totalTrips: 5,
                ),

                SizedBox(height: 0.02.sh),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Pages list index ke according
    final List<Widget> pages = [
      _buildHomeBody(),
      const EarningsScreen(),
      Center(child: Text('Profile Screen')),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Selected Screen Content
            Expanded(
              child: pages[selectedNavIndex],
            ),

            /// Custom Bottom Navbar
            DriverBottomNavbarWidget(
              selectedIndex: selectedNavIndex,
              onTabSelected: (index) {
                setState(() {
                  selectedNavIndex = index;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}