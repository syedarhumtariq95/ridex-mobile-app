import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
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
  bool isApproved = true;
  int selectedNavIndex = 0;
  bool isLoading = true;
  bool _isScreenOpened = false;

  // Real Dynamic Metrics from DB
  double _dashboardEarnings = 0.0;
  int _dashboardTripsCount = 0;

  // Processed / Ignored rides ki IDs track rakhne ke liye
  final Set<String> _processedRideIds = {};
  bool _isInitialFetchDone = false;

  StreamSubscription? _rideStreamSubscription;

  @override
  void initState() {
    super.initState();
    _fetchDriverStatus();
    _fetchDashboardMetrics();
  }

  @override
  void dispose() {
    _stopRidesListener();
    super.dispose();
  }

  /// Supabase se completed rides fetch karke total earnings aur trips calculate karna
  Future<void> _fetchDashboardMetrics() async {
    final driverId = DI.i<SupabaseClient>().auth.currentUser?.id;
    if (driverId == null) return;

    try {
      final response = await DI.i<SupabaseClient>()
          .from('rides')
          .select('fare')
          .eq('status', 'completed')
          .eq('driver_id', driverId);

      double total = 0.0;
      for (var r in response) {
        final fareVal = r['fare'];
        total += fareVal is num
            ? fareVal.toDouble()
            : double.tryParse(fareVal?.toString() ?? '0') ?? 0.0;
      }

      if (mounted) {
        setState(() {
          _dashboardEarnings = total;
          _dashboardTripsCount = response.length;
        });
      }
    } catch (e) {
      debugPrint("Error fetching dashboard metrics: $e");
    }
  }

  Future<void> _fetchDriverStatus() async {
    final userId = DI.i<SupabaseClient>().auth.currentUser?.id;
    if (userId != null) {
      final approved =
      await DI.i<DriverRepository>().checkDriverApprovalStatus(userId);
      setState(() {
        isApproved = approved;
        isLoading = false;
      });
    }
  }

  /// InDrive/Yango Style Real-time Request Handler
  void _startRidesListener() {
    _stopRidesListener();
    _isInitialFetchDone = false;

    _rideStreamSubscription = DI.i<SupabaseClient>()
        .from('rides')
        .stream(primaryKey: ['id'])
        .eq('status', 'pending')
        .listen((List<Map<String, dynamic>> data) async {
      if (!isOnline || !mounted) return;

      // STEP 1:
      if (!_isInitialFetchDone) {
        for (var ride in data) {
          if (ride['id'] != null) {
            _processedRideIds.add(ride['id'].toString());
          }
        }
        _isInitialFetchDone = true;
        return;
      }

      if (_isScreenOpened || data.isEmpty) return;

      // STEP 2:
      final incomingRides = data.where((ride) {
        final String? id = ride['id']?.toString();
        return id != null && !_processedRideIds.contains(id);
      }).toList();

      if (incomingRides.isNotEmpty) {
        final newRide = incomingRides.last;
        final String rideId = newRide['id'].toString();

        _processedRideIds.add(rideId);
        _isScreenOpened = true;

        await Navigator.pushNamed(
          context,
          CustomRouter.newRideRequestScreenRouteName,
          arguments: newRide,
        );

        _isScreenOpened = false;

        // Ride complete hone ke baad dashboard wapas aate hi metrics refresh karein
        _fetchDashboardMetrics();
      }
    });
  }

  void _stopRidesListener() {
    _rideStreamSubscription?.cancel();
    _rideStreamSubscription = null;
  }

  Future<void> _toggleOnlineStatus(bool value) async {
    if (!isApproved && value) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot go online. Profile is pending verification."),
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

    if (value) {
      _startRidesListener();
    } else {
      _stopRidesListener();
    }

    try {
      await DI.i<DriverRepository>().updateOnlineStatus(userId, value);
    } catch (e) {
      setState(() {
        isOnline = !value;
      });
      if (isOnline) {
        _startRidesListener();
      } else {
        _stopRidesListener();
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to update status: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildHomeBody() {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _fetchDashboardMetrics,
        child: Column(
          children: [
            if (!isApproved)
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 0.04.sw,
                  vertical: 0.012.sh,
                ),
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
                physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: Column(
                  children: [
                    DriverOnlineStatusWidget(
                      isOnline: isOnline,
                      onStatusChanged: _toggleOnlineStatus,
                    ),
                    SizedBox(height: 0.04.sh),

                    /// Dynamic Real Earnings Card
                    DriverEarningsCardWidget(
                      earnings: _dashboardEarnings.toStringAsFixed(0),
                      totalRides: _dashboardTripsCount,
                    ),
                    SizedBox(height: 0.04.sh),

                    /// Dynamic Real Overview Widget
                    DriverOverviewWidget(
                      timeOnline: isOnline ? 'Online' : 'Offline',
                      totalTrips: _dashboardTripsCount,
                    ),
                    SizedBox(height: 0.02.sh),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                // Tab switch
                if (index == 0) {
                  _fetchDashboardMetrics();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}