
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class NavigationInstructionCardWidget extends StatelessWidget {
  final String distance;
  final String instruction;

  const NavigationInstructionCardWidget({
    super.key,
    required this.distance,
    required this.instruction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05.sw,
        vertical: 0.018.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.turn_right,
            color: ThemeColors.kFontBlackColor,
            size: 36.sp,
          ),
          SizedBox(width: 0.04.sw),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  distance,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800,
                    color: ThemeColors.kFontBlackColor,
                  ),
                ),
                SizedBox(height: 0.002.sh),
                Text(
                  instruction,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ThemeColors.kFontGreyColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}