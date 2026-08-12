import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';

import '../../../../../configs/texts/texts.dart';
import '../../../../../configs/theme/theme_colors.dart';

class SavedPlacesWidget extends StatelessWidget {
  const SavedPlacesWidget({super.key});

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
            title: CustomTexts.home,
            address: CustomTexts.lahore,
          ),

          SizedBox(
            height: 0.012.sh,
          ),

          /// Work
          _SavedPlaceCard(
            icon: CustomIconsPath.workPath,
            title: CustomTexts.work,
            address: CustomTexts.software,
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

  const _SavedPlaceCard({
    required this.icon,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.04.sw,
        vertical: 0.022.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: ThemeColors.kBorderGreyColor,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
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
                    fontSize: 12.sp,
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