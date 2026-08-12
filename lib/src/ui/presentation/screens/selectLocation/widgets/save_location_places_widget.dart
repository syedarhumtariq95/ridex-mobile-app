import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';

import '../../../../../configs/texts/texts.dart';
import '../../../../../configs/theme/theme_colors.dart';

class SaveLocationPlacesWidget extends StatelessWidget {
  const SaveLocationPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.05.sw,
      ),
      child: Column(
        children: [
          /// Home
          _SavedPlaceCard(
            icon: CustomIconsPath.locationPath,
            title: CustomTexts.pickup,
            address: CustomTexts.gulberg,
            onTap: () {

            },
          ),

          SizedBox(
            height: 0.012.sh,
          ),

          /// Work
          _SavedPlaceCard(
            icon: CustomIconsPath.locationPath,
            title: CustomTexts.drop,
            address: CustomTexts.mall,
            onTap: () {
              // Work tap action
            },
          ),
        ],
      ),
    );
  }
}

class _SavedPlaceCard extends StatelessWidget {
  final String icon;
  final String title;
  final String address;
  final VoidCallback? onTap;

  const _SavedPlaceCard({
    required this.icon,
    required this.title,
    required this.address,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.04.sw,
              vertical: 0.040.sh,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 0.06.sw,
                  height: 0.06.sw,
                  fit: BoxFit.contain,
                ),

                SizedBox(
                  width: 0.035.sw,
                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ThemeColors.kFontGreyColor,

                        ),
                      ),

                      SizedBox(
                        height: 0.005.sh,
                      ),

                      Text(
                        address,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,

                        ),
                      ),
                    ],
                  ),
                ),

                /// Forward Arrow Icon
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16.sp,
                  color: ThemeColors.kFontGreyColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}