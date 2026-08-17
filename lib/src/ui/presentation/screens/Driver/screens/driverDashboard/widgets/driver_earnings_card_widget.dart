import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverEarningsCardWidget extends StatelessWidget {
  final String earnings;
  final int totalRides;

  const DriverEarningsCardWidget({
    super.key,
    required this.earnings,
    required this.totalRides,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05.sw,
        vertical: 0.02.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Today's Earnings",
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 20.sp,
              color: ThemeColors.kFontGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 0.008.sh),
          Text(
            'PKR $earnings',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 26.sp,
              fontWeight: FontWeight.w800,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
          SizedBox(height: 0.008.sh),
          Text(
            '$totalRides Rides',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ThemeColors.kFontGreyColor,
            ),
          ),
        ],
      ),
    );
  }
}