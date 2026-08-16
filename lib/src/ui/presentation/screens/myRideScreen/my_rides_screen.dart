import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/myRideScreen/widgets/ride_history_card_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/myRideScreen/widgets/ride_history_tab_bar_widget.dart';

class MyRidesScreen extends StatefulWidget {
  MyRidesScreen({super.key});

  @override
  State<MyRidesScreen> createState() => _MyRidesScreenState();
}

class _MyRidesScreenState extends State<MyRidesScreen> {
  int selectedTabIndex = 0;

  final List<Map<String, String>> ridesList = [
    {
      'pickup': 'Packages Mall',
      'dropoff': 'Gulberg 3, Lahore',
      'dateTime': '24 May, 10:30 AM',
      'price': '450',
    },
    {
      'pickup': 'Emporium Mall',
      'dropoff': 'DHA Phase 5, Lahore',
      'dateTime': '22 May, 08:15 PM',
      'price': '620',
    },
    {
      'pickup': 'Airport',
      'dropoff': 'Gulberg 3, Lahore',
      'dateTime': '18 May, 10:30 AM',
      'price': '800',
    },
    {
      'pickup': 'Liberty Market',
      'dropoff': 'DHA Phase 5, Lahore',
      'dateTime': '15 May, 09:00 PM',
      'price': '300',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Column(
            children: [
              SizedBox(height: 0.02.sh),

              /// Header Title with Back Arrow
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_rounded,
                      size: 22.sp,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'My Rides',
                        style: TextStyle(
                          fontFamily: FontsConfigs.poppinsFonts,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeColors.kFontBlackColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 22.sp),
                ],
              ),

              SizedBox(height: 0.025.sh),

              /// Tab Bar Selector
              RideHistoryTabBarWidget(
                selectedIndex: selectedTabIndex,
                onTabSelected: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
              ),

              SizedBox(height: 0.02.sh),

              /// Rides List View
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: ridesList.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 0.015.sh),
                  itemBuilder: (context, index) {
                    final ride = ridesList[index];
                    return RideHistoryCardWidget(
                      pickupLocation: ride['pickup']!,
                      dropoffLocation: ride['dropoff']!,
                      dateAndTime: ride['dateTime']!,
                      price: ride['price']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
