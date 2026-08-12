import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';

import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../enum/enum.dart';

class RideOptionCard extends StatelessWidget {
  final RideType rideType;
  final bool isSelected;
  final VoidCallback onTap;

  RideOptionCard({
    super.key,
    required this.rideType,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 0.04.sw,
          vertical: 0.028.sh,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: isSelected
                ? ThemeColors.kFontGreenColor
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.r,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              rideType.imagePath,
              width: 0.18.sw,
              height: 0.08.sh,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.directions_car_rounded,
                size: 0.12.sw,
                color: ThemeColors.kFontGreyColor,
              ),
            ),
            SizedBox(width: 0.04.sw),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rideType.title,
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                  SizedBox(height: 0.003.sh),
                  Text(
                    rideType.seats,
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 14.sp,
                      color: ThemeColors.kFontGreyColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  rideType.price,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.kFontBlackColor,
                  ),
                ),
                if (isSelected) ...[
                  SizedBox(width: 0.025.sw),
                  Container(
                    padding: EdgeInsets.all(0.008.sw),
                    decoration: BoxDecoration(
                      color: ThemeColors.kFontGreenColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}