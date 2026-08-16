import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class FindingDriverRadarWidget extends StatelessWidget {
  const FindingDriverRadarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.7.sw,
      height: 0.7.sw,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ThemeColors.kFontGreenColor.withOpacity(0.08),
      ),
      alignment: Alignment.center,
      child: Container(
        width: 0.5.sw,
        height: 0.5.sw,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeColors.kFontGreenColor.withOpacity(0.15),
        ),
        alignment: Alignment.center,
        child: Container(
          width: 0.28.sw,
          height: 0.28.sw,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: ThemeColors.kFontGreenColor,
            boxShadow: [
              BoxShadow(
                color: ThemeColors.kFontGreenColor.withOpacity(0.3),
                blurRadius: 15.r,
                spreadRadius: 3,
              ),
            ],
          ),
          child: Icon(
            Icons.directions_car_rounded,
            size: 0.12.sw,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
