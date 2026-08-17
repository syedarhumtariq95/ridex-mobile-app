import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class PendingVerificationHeaderWidget extends StatelessWidget {
  const PendingVerificationHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Document / Clipboard Icon with Green Check Badge
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              width: 0.35.sw,
              height: 0.35.sw,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Icon(
                Icons.assignment_ind_rounded,
                size: 80.sp,
                color: ThemeColors.kFontGreyColor,
              ),
            ),
            Container(
              width: 0.1.sw,
              height: 0.1.sw,
              decoration: BoxDecoration(
                color: ThemeColors.kFontGreenColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.5,
                ),
              ),
              child: Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 22.sp,
              ),
            ),
          ],
        ),

        SizedBox(height: 0.04.sh),

        /// Main Heading Text
        Text(
          'Your documents are\nunder review.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 28.sp,
            fontWeight: FontWeight.w700,
            color: ThemeColors.kFontBlackColor,
            height: 1.3,
          ),
        ),

        SizedBox(height: 0.012.sh),

        /// Subtitle Text
        Text(
          'We will notify you once\nyour account is verified.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 20.sp,
            color: ThemeColors.kFontGreyColor,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}