import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import '../../../../../../../configs/button/driver_custom_button.dart';

class NavigationBottomBarWidget extends StatelessWidget {
  final String time;
  final String distance;
  final VoidCallback onNavigateTap;

  const NavigationBottomBarWidget({
    super.key,
    required this.time,
    required this.distance,
    required this.onNavigateTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05.sw,
        vertical: 0.015.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// ETA & Distance Text
          Text(
            '$time • $distance',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: ThemeColors.kFontBlackColor,
            ),
          ),

          /// Navigate Action Button
          SizedBox(
            width: 0.35.sw,
            child: DriverCustomButton(
              text: 'Navigate',
              onPressed: onNavigateTap,
            ),
          ),
        ],
      ),
    );
  }
}