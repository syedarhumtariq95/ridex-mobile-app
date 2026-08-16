import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../../../configs/texts/texts.dart';

class FindingDriverTextWidget extends StatelessWidget {
  const FindingDriverTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          CustomTexts.findingyouadriver,
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 22.sp,
            fontWeight: FontWeight.w800,
            color: ThemeColors.kFontBlackColor,
          ),
        ),
        SizedBox(height: 0.01.sh),
        Text(
          CustomTexts.thismaytakeafewseconds,
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ThemeColors.kFontGreyColor,
          ),
        ),
      ],
    );
  }
}
