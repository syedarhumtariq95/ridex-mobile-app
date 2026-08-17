import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../../../../../configs/router/routes.dart';
import '../../../../../../../configs/router/screen_navigation_service.dart';

class DriverOverviewWidget extends StatelessWidget {
  final String timeOnline;
  final int totalTrips;

  const DriverOverviewWidget({
    super.key,
    required this.timeOnline,
    required this.totalTrips,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            ScreenNavigationService.navigationPush(
              CustomRouter.newRideRequestScreenRouteName,
              replacement: false,
            );
          },
          child: Text(
            "Today's Overview",
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 26.sp,
              fontWeight: FontWeight.w700,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
        ),
        SizedBox(height: 0.015.sh),
        Container(
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
          child: Row(
            children: [
              /// Left Titles
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time Online',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 20.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.012.sh),
                    Text(
                      'Trips',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 20.sp,
                        color: ThemeColors.kFontBlackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              /// Right Dynamic Values
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    timeOnline,
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                  SizedBox(height: 0.012.sh),
                  Text(
                    '$totalTrips',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}