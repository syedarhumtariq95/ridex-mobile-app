import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/icons/icons.dart';
import '../../../../../configs/router/routes.dart';
import '../../../../../configs/router/screen_navigation_service.dart';
import '../../../../../configs/texts/texts.dart';

class LocationSearchWidget extends StatelessWidget {
  LocationSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.04.sw,
        vertical: 0.024.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 12.r,
            spreadRadius: 1.r,
            offset: Offset(
              0,
              4.h,
            ),
          ),
        ],
      ),
      child: Row(
        children: [
          CustomIcons(
            iconPath: CustomIconsPath.locationPath,
            size: 0.055.sw,
            color: Colors.black,
          ),

          SizedBox(
            width: 0.03.sw,
          ),

          GestureDetector(
            onTap: () {
              ScreenNavigationService.navigationPush(
                CustomRouter.selectLocationScreenRouteName,
                replacement: false,
              );
            },
            child: Text(
              CustomTexts.whereto,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}