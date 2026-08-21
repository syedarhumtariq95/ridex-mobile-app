import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button_second.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import 'package:ridex_mobile_app/src/configs/router/screen_navigation_service.dart';
import 'package:ridex_mobile_app/src/configs/texts/texts.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../blocs/authentication/authentication_bloc.dart';
import '../../../generics/widgets/text/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUserSession();
  }

  void _checkUserSession() {
    // Session restore event trigger
    DI.i<AuthenticationBloc>().add(CheckSavedUserSessionRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: DI.i<AuthenticationBloc>(),
        listener: (context, state) {
          if (state is UserLoginSuccess) {
            // Check user role and route accordingly
            final role = state.user.role;
            if (role == 'driver') {
              ScreenNavigationService.navigationPush(
                CustomRouter.driverDetailScreenRouteName,
                replacement: true,
              );
            } else {
              ScreenNavigationService.navigationPush(
                CustomRouter.homeScreenRouteName,
                replacement: true,
              );
            }
          }
        },
        child: Center(
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
              CustomButton(
                text: CustomTexts.getstarted,
                onPressed: () {
                  ScreenNavigationService.navigationPush(
                    CustomRouter.onboardingScreenRouteName,
                    replacement: false,
                  );
                },
              ),
              SizedBox(height: 0.02.sh),
              CustomButtonSecond(
                text: CustomTexts.continueasguest,
                onPressed: () {
                  ScreenNavigationService.navigationPush(
                    CustomRouter.chooseAccountTypeScreenRouteName,
                    replacement: false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}