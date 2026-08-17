import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DailyEarningsItemWidget extends StatelessWidget {
  final String date;
  final String fare;

  const DailyEarningsItemWidget({
    super.key,
    required this.date,
    required this.fare,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.015.sh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date,
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
          Text(
            'PKR $fare',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}