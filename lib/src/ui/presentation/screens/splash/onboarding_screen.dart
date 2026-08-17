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

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": CustomIconsPath.rentalPath,
      "title": CustomTexts.affordable,
      "subtitle": CustomTexts.bookride,
    },
    {
      "image": CustomIconsPath.fastPath,
      "title": CustomTexts.fastpickup,
      "subtitle": CustomTexts.getpickup,
    },
    {
      "image": CustomIconsPath.safePath,
      "title": CustomTexts.safejourney,
      "subtitle": CustomTexts.travelsafely,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIcons(
                      iconPath: onboardingData[index]["image"]!,
                    ),

                    SizedBox(height: 0.06.sh),

                    CustomText(
                      onboardingData[index]["title"]!,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 32.sp,
                        color: ThemeColors.kFontBlackColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    SizedBox(height: 0.03.sh),

                    CustomText(
                      onboardingData[index]["subtitle"]!,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 20.sp,
                        color: ThemeColors.kFontGreyColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboardingData.length,
                  (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4.h),
                width: currentPage == index ? 12 : 8,
                height: 0.01.sh,
                decoration: BoxDecoration(
                  color: currentPage == index
                      ? Colors.green
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),

          SizedBox(height: 0.1.sh),

          CustomButton(
            text: currentPage == onboardingData.length - 1
                ? CustomTexts.finish
                : CustomTexts.next,
            onPressed: () {
              if (currentPage < onboardingData.length - 1) {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              ScreenNavigationService.navigationPush(
                CustomRouter.chooseAccountTypeScreenRouteName,
                replacement: false,
              );
            },
          ),
          SizedBox(height: 0.1.sh),
        ],
      ),
    );
  }
}
