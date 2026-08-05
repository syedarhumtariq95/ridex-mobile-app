import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../../configs/app/fonts_configs.dart';
import '../../../../configs/button/custom_button_second.dart';
import '../../../../configs/router/routes.dart';
import '../../../../configs/router/screen_navigation_service.dart';
import '../../../../configs/texts/texts.dart';
import '../../../generics/widgets/text/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  CustomTexts.ride,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 72.sp,
                    color: ThemeColors.kFontBlackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 1.w),
                CustomText(
                  CustomTexts.x,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 72.sp,
                    color: ThemeColors.kFontGreenColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),

            CustomText(
              CustomTexts.yourride,
              style: TextStyle(
                fontFamily: FontsConfigs.poppinsFonts,
                fontSize: 20.sp,
                color: ThemeColors.kFontGreyColor,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 0.01.sh),
            CustomIcons(iconPath: CustomIconsPath.carPath),
            SizedBox(height: 0.06.sh),
            CustomButton(text: CustomTexts.getstarted, onPressed: () {
              ScreenNavigationService.navigationPush(
                CustomRouter.onboardingScreenRouteName,
                replacement: false,
              );
            }),
            SizedBox(height: 0.02.sh),
            CustomButtonSecond(text: CustomTexts.continueasguest, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
