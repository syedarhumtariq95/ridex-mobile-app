import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class ProfileMenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.018.sh, horizontal: 0.02.sw),
        child: Row(
          children: [
            Icon(icon, size: 24.sp, color: ThemeColors.kFontBlackColor),
            SizedBox(width: 0.04.sw),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 22.sp,
              color: ThemeColors.kFontGreyColor,
            ),
          ],
        ),
      ),
    );
  }
}
