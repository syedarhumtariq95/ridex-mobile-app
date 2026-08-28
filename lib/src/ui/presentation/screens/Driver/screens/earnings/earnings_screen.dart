import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'widgets/daily_earnings_item_widget.dart';
import 'widgets/earnings_filter_dropdown_widget.dart';
import 'widgets/earnings_stat_card_widget.dart';
import 'widgets/total_earnings_banner_widget.dart';

class EarningsScreen extends StatefulWidget {
  const EarningsScreen({super.key});

  @override
  State<EarningsScreen> createState() => _EarningsScreenState();
}

class _EarningsScreenState extends State<EarningsScreen> {
  String _selectedFilter = 'This Week';
  bool _isLoading = true;

  double _totalEarnings = 0;
  int _totalTripsCount = 0;
  List<Map<String, String>> _dailyEarningsList = [];

  @override
  void initState() {
    super.initState();
    _fetchEarningsData();
  }

  Future<void> _fetchEarningsData() async {
    final driverId = DI.i<SupabaseClient>().auth.currentUser?.id;
    if (driverId == null) return;

    setState(() => _isLoading = true);

    try {
      // 1. Fetch completed rides for logged in driver
      final response = await DI.i<SupabaseClient>()
          .from('rides')
          .select()
          .eq('status', 'completed')
          .eq('driver_id', driverId)
          .order('created_at', ascending: false);

      final List<dynamic> rides = response as List<dynamic>;

      double total = 0;
      Map<String, double> dailyMap = {};

      for (var ride in rides) {
        // Safe double parsing for fare
        final fareVal = ride['fare'];
        final double fare = fareVal is num
            ? fareVal.toDouble()
            : double.tryParse(fareVal?.toString() ?? '0') ?? 0.0;

        total += fare;

        // Date parse format (YYYY-MM-DD)
        if (ride['created_at'] != null) {
          final DateTime date = DateTime.parse(ride['created_at'].toString());
          final String dateKey = "${date.day}/${date.month}/${date.year}";
          dailyMap[dateKey] = (dailyMap[dateKey] ?? 0) + fare;
        }
      }

      List<Map<String, String>> formattedList = dailyMap.entries.map((e) {
        return {
          'date': e.key,
          'fare': e.value.toStringAsFixed(0),
        };
      }).toList();

      if (mounted) {
        setState(() {
          _totalEarnings = total;
          _totalTripsCount = rides.length;
          _dailyEarningsList = formattedList;
          _isLoading = false;
        });
      }
    } catch (e) {
      debugPrint("Error fetching earnings: $e");
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : RefreshIndicator(
          onRefresh: _fetchEarningsData,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 0.05.sw,
              vertical: 0.015.sh,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: EarningsFilterDropdownWidget(
                    selectedFilter: _selectedFilter,
                    onFilterChanged: (newFilter) {
                      setState(() => _selectedFilter = newFilter);
                    },
                  ),
                ),
                SizedBox(height: 0.02.sh),

                /// Total Earnings
                TotalEarningsBannerWidget(
                  amount: _totalEarnings.toStringAsFixed(0),
                ),

                SizedBox(height: 0.02.sh),

                /// Stat Cards Row
                Row(
                  children: [
                    Expanded(
                      child: EarningsStatCardWidget(
                        title: 'Trips',
                        value: '$_totalTripsCount',
                      ),
                    ),
                    SizedBox(width: 0.04.sw),
                    Expanded(
                      child: const EarningsStatCardWidget(
                        title: 'Online',
                        value: 'Active',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 0.025.sh),

                /// Dynamic Daily Earnings List
                _dailyEarningsList.isEmpty
                    ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.05.sh),
                  child: const Center(
                    child: Text("No completed rides yet"),
                  ),
                )
                    : Column(
                  children: _dailyEarningsList.map((item) {
                    return DailyEarningsItemWidget(
                      date: item['date']!,
                      fare: item['fare']!,
                    );
                  }).toList(),
                ),

                SizedBox(height: 0.015.sh),
              ],
            ),
          ),
        ),
      ),
    );
  }
}