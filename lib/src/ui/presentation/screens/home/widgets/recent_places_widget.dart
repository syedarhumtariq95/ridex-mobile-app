import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../configs/texts/texts.dart';
import '../../../../../configs/theme/theme_colors.dart';

class RecentPlacesWidget extends StatelessWidget {
  const RecentPlacesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 0.05.sw,
        right: 0.05.sw,
        top: 0.025.sh,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CustomTexts.recent,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(
            height: 0.015.sh,
          ),

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 0.005.sh,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: ThemeColors.kBorderGreyColor,
                width: 1,
              ),
            ),
            child: Column(
              children: [
                _RecentPlaceCard(
                  icon: Icons.location_city,
                  title: CustomTexts.mall,
                ),

                _RecentPlaceCard(
                  icon: Icons.location_city,
                  title: CustomTexts.emporium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RecentPlaceCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _RecentPlaceCard({
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 0.04.sw,
        vertical: 0.018.sh,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 0.070.sw,
            color: Colors.black,
          ),

          SizedBox(
            width: 0.035.sw,
          ),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}