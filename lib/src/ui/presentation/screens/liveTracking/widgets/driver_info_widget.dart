import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../../../configs/images/images.dart';
import '../../../../../configs/router/routes.dart';
import '../../../../../configs/router/screen_navigation_service.dart';

class DriverInfoWidget extends StatelessWidget {
  DriverInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Scaled Up Profile Image
        Container(
          width: 0.18.sw,
          height: 0.18.sw,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(CustomImagesPath.alirazaImagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),

        SizedBox(width: 0.04.sw),

        /// Driver Details (Scaled Text & Spacing)
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      ScreenNavigationService.navigationPush(
                        CustomRouter.rideCompletedScreenRouteName,
                        replacement: false,
                      );
                    },
                    child: Text(
                      'Ali Raza',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.kFontBlackColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 0.02.sw),
                  Icon(Icons.star_rounded, color: Colors.amber, size: 22.sp),
                  SizedBox(width: 0.01.sw),
                  Text(
                    '4.8',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.005.sh),
              Text(
                'Honda City - LHR 1234',
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 14.sp,
                  color: ThemeColors.kFontGreyColor,
                ),
              ),
            ],
          ),
        ),

        /// Shield / Safety Icon
        Icon(
          Icons.shield_outlined,
          color: ThemeColors.kFontGreyColor,
          size: 24.sp,
        ),
      ],
    );
  }
}
