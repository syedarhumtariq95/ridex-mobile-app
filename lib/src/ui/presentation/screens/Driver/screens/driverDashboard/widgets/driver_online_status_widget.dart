import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverOnlineStatusWidget extends StatelessWidget {
  final bool isOnline;
  final ValueChanged<bool> onStatusChanged;

  const DriverOnlineStatusWidget({
    super.key,
    required this.isOnline,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          isOnline ? "You're Online" : "You're Offline",
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: ThemeColors.kFontBlackColor,
          ),
        ),
        Switch.adaptive(
          value: isOnline,
          activeColor: ThemeColors.kFontGreenColor,
          activeTrackColor: ThemeColors.kFontGreenColor.withOpacity(0.3),
          onChanged: onStatusChanged,
        ),
      ],
    );
  }
}