import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class FareAndPaymentCardWidget extends StatelessWidget {
  final String totalFare;
  final String paymentMethod;

  const FareAndPaymentCardWidget({
    super.key,
    required this.totalFare,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Total Fare Box
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.018.sh,
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
                'Total Fare',
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 22.sp,
                  color: ThemeColors.kFontGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 0.004.sh),
              Text(
                'PKR $totalFare',
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w800,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 0.012.sh),

        /// Payment Method Selector Box
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 0.05.sw,
            vertical: 0.016.sh,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                paymentMethod,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: ThemeColors.kFontBlackColor,
                size: 24.sp,
              ),
            ],
          ),
        ),
      ],
    );
  }
}