import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  final List<Map<String, String>> _dailyEarningsList = [
    {'date': 'Mon, 20 May', 'fare': '2,450'},
    {'date': 'Tue, 21 May', 'fare': '2,300'},
    {'date': 'Wed, 22 May', 'fare': '2,000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.015.sh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Top Right Dropdown Filter Alignment
              Align(
                alignment: Alignment.centerRight,
                child: EarningsFilterDropdownWidget(
                  selectedFilter: _selectedFilter,
                  onFilterChanged: (newFilter) {
                    setState(() {
                      _selectedFilter = newFilter;
                    });
                  },
                ),
              ),

              SizedBox(height: 0.02.sh),

              /// Total Earnings Banner
              TotalEarningsBannerWidget(
                amount: '12,450',
              ),

              SizedBox(height: 0.02.sh),

              /// Trips & Online Time Stat Cards Row
              Row(
                children: [
                  Expanded(
                    child: EarningsStatCardWidget(
                      title: 'Trips',
                      value: '25',
                    ),
                  ),
                  SizedBox(width: 0.04.sw),
                  Expanded(
                    child: EarningsStatCardWidget(
                      title: 'Online',
                      value: '18h 20m',
                    ),
                  ),
                ],
              ),

              SizedBox(height: 0.025.sh),

              /// Daily Earnings List
              Column(
                children: _dailyEarningsList.map((item) {
                  return DailyEarningsItemWidget(
                    date: item['date']!,
                    fare: item['fare']!,
                  );
                }).toList(),
              ),

              SizedBox(height: 0.015.sh),

              /// See All Button
              Center(
                child: TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'See all',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF5B39A8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 0.02.sh),
            ],
          ),
        ),
      ),
    );
  }
}