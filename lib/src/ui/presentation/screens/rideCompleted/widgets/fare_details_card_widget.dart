import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class FareDetailsCardWidget extends StatelessWidget {
  final String amount;

  FareDetailsCardWidget({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Fare',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 13.sp,
              color: ThemeColors.kFontGreyColor,
            ),
          ),
          SizedBox(height: 0.005.sh),
          Text(
            'PKR $amount',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 20.sp,
              fontWeight: FontWeight.w800,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}
