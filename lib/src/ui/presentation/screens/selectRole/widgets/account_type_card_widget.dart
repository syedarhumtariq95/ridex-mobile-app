import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class AccountTypeCardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const AccountTypeCardWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 0.04.sw,
              vertical: 0.02.sh,
            ),
            decoration: BoxDecoration(
              color: isSelected ? Colors.white : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: isSelected
                    ? ThemeColors.kFontGreenColor
                    : Colors.grey.shade200,
                width: isSelected ? 1.8 : 1,
              ),
              boxShadow: isSelected
                  ? [
                BoxShadow(
                  color: ThemeColors.kFontGreenColor.withOpacity(0.08),
                  blurRadius: 10.r,
                  spreadRadius: 2,
                ),
              ]
                  : [],
            ),
            child: Row(
              children: [
                /// Left Rounded Icon Background
                Container(
                  width: 0.16.sw,
                  height: 0.16.sw,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? ThemeColors.kFontGreenColor.withOpacity(0.12)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Icon(
                    icon,
                    size: 32.sp,
                    color: isSelected
                        ? ThemeColors.kFontGreenColor
                        : ThemeColors.kFontBlackColor,
                  ),
                ),

                SizedBox(width: 0.04.sw),

                /// Title & Subtitle Section
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: FontsConfigs.poppinsFonts,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          color: ThemeColors.kFontBlackColor,
                        ),
                      ),
                      SizedBox(height: 0.004.sh),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontFamily: FontsConfigs.poppinsFonts,
                          fontSize: 12.sp,
                          color: ThemeColors.kFontGreyColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /// Selection Green Check Badge Top Right
          if (isSelected)
            Positioned(
              top: 0.015.sh,
              right: 0.04.sw,
              child: Container(
                width: 0.055.sw,
                height: 0.055.sw,
                decoration: BoxDecoration(
                  color: ThemeColors.kFontGreenColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
        ],
      ),
    );
  }
}