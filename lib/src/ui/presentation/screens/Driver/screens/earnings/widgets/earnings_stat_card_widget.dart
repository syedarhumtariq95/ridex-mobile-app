import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class EarningsStatCardWidget extends StatelessWidget {
  final String title;
  final String value;

  const EarningsStatCardWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.04.sw,
        vertical: 0.022.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: ThemeColors.kFontGreyColor,
            ),
          ),
          SizedBox(height: 0.01.sh),
          Text(
            value,
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}