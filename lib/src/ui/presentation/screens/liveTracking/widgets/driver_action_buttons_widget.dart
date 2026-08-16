import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverActionButtonsWidget extends StatelessWidget {
  final VoidCallback onChatTap;
  final VoidCallback onCallTap;

  DriverActionButtonsWidget({
    super.key,
    required this.onChatTap,
    required this.onCallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Chat Button (Increased height & icon size)
        Expanded(
          child: GestureDetector(
            onTap: onChatTap,
            child: Container(
              height: 0.065.sh,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 22.sp,
                    color: ThemeColors.kFontBlackColor,
                  ),
                  SizedBox(width: 0.025.sw),
                  Text(
                    'Chat',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(width: 0.04.sw),

        /// Call Button (Increased height & icon size)
        Expanded(
          child: GestureDetector(
            onTap: onCallTap,
            child: Container(
              height: 0.065.sh,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call_outlined,
                    size: 22.sp,
                    color: ThemeColors.kFontBlackColor,
                  ),
                  SizedBox(width: 0.025.sw),
                  Text(
                    'Call',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
