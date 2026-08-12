import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';

import '../../../../../configs/images/images.dart';
import '../../../../../configs/theme/theme_colors.dart';


class LocationMapWidget extends StatelessWidget {
  LocationMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.50.sh,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Map
          SizedBox(
            width: double.infinity,
            height: 0.50.sh,
            child: Image.asset(
              CustomImagesPath.maplocationImagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Top Buttons
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05.sw,
                vertical: 0.02.sh,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Menu Button
                  Container(
                    height: 0.06.sh,
                    width: 0.13.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: ThemeColors.kFontGreyColor,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: CustomIcons(iconPath: CustomIconsPath.menuPath),
                    ),
                  ),


                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}