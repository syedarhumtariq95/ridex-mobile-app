import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class RideCompletedHeaderWidget extends StatelessWidget {
  RideCompletedHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Green Success Check Icon Container
        Container(
          width: 0.28.sw,
          height: 0.28.sw,
          decoration: BoxDecoration(
            color: Color(0xFF28A745),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check_rounded, color: Colors.white, size: 55.sp),
        ),

        SizedBox(height: 0.03.sh),

        /// Main Title
        Text(
          'Ride Completed!',
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            color: ThemeColors.kFontBlackColor,
          ),
        ),

        SizedBox(height: 0.01.sh),

        /// Subtitle Text
        Text(
          'You have reached your\ndestination.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 14.sp,
            color: ThemeColors.kFontGreyColor,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
