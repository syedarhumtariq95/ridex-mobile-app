import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_bottom_navbar_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_earnings_card_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_online_status_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/widgets/driver_overview_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/earnings/earnings_screen.dart';
import '../../../../../resources/driverDetail/driver_detail_repository.dart';
import '../driverProfileScreen/driver_profile_screen.dart';

class DriverDashboardScreen extends StatefulWidget {
  const DriverDashboardScreen({super.key});

  @override
  State<DriverDashboardScreen> createState() => _DriverDashboardScreenState();
}

class _DriverDashboardScreenState extends State<DriverDashboardScreen> {
  bool isOnline = false;
  bool isApproved = true; // Default true, fetch hone tak
  int selectedNavIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDriverStatus();
  }

  Future<void> _fetchDriverStatus() async {
    final userId = DI.i<SupabaseClient>().auth.currentUser?.id;
    if (userId != null) {
      final approved = await DI.i<DriverRepository>().checkDriverApprovalStatus(userId);
      setState(() {
        isApproved = approved;
        isLoading = false;
      });
    }
  }

  Future<void> _toggleOnlineStatus(bool value) async {
    if (!isApproved && value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot go online. Your profile is pending verification."),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final userId = DI.i<SupabaseClient>().auth.currentUser?.id;
    if (userId == null) return;

    setState(() {
      isOnline = value;
    });

    try {
      await DI.i<DriverRepository>().updateOnlineStatus(userId, value);
    } catch (e) {
      setState(() {
        isOnline = !value; // Rollback on error
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update status: $e"), backgroundColor: Colors.red),
      );
    }
  }

  /// Home Tab Body Content
  Widget _buildHomeBody() {
    return SafeArea(
      child: Column(
        children: [
          /// Verification Pending Banner (If not approved)
          if (!isApproved)
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.012.sh),
              color: Colors.amber.shade700,
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.white),
                  SizedBox(width: 0.02.sw),
                  Expanded(
                    child: Text(
                      "Profile Under Review. You cannot receive ride requests yet.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

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
                    onStatusChanged: _toggleOnlineStatus,
                  ),

                  SizedBox(height: 0.04.sh),

                  /// Today's Earnings Card
                  const DriverEarningsCardWidget(earnings: '0', totalRides: 0),

                  SizedBox(height: 0.04.sh),

                  /// Today's Overview Section
                  const DriverOverviewWidget(timeOnline: '0h 0m', totalTrips: 0),

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
    final List<Widget> pages = [
      _buildHomeBody(),
      const SafeArea(child: EarningsScreen()),
      const DriverProfileScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(child: pages[selectedNavIndex]),
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