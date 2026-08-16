import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverStatusStripWidget extends StatelessWidget {
  DriverStatusStripWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.018.sh),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.chevron_left_rounded,
            color: ThemeColors.kFontGreyColor,
            size: 24.sp,
          ),
          Text(
            'Your driver is on the way',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: ThemeColors.kFontGreyColor,
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
