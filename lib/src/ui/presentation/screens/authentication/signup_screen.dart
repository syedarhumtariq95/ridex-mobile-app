import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button_second.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import 'package:ridex_mobile_app/src/configs/router/screen_navigation_service.dart';
import 'package:ridex_mobile_app/src/configs/texts/texts.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/widgets/custom_password_field.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/widgets/custom_text_field.dart';

import '../../../generics/widgets/text/custom_text.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.01.sh),

              /// Title
              CustomText(
                CustomTexts.createaccount,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 32.sp,
                  color: ThemeColors.kFontBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 0.01.sh),

              CustomText(
                CustomTexts.signuptogetstarted,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 20.sp,
                  color: ThemeColors.kFontGreyColor,
                ),
              ),

              SizedBox(height: 0.04.sh),

              CustomTextField(
                label: CustomTexts.firstname,
                hintText: CustomTexts.enteryourfirstname,
                prefixIcon: CustomIconsPath.profilePath,
              ),
              SizedBox(height: 0.03.sh),

              CustomTextField(
                label: CustomTexts.lastname,
                hintText: CustomTexts.lastname,
                prefixIcon: CustomIconsPath.profilePath,
              ),
              SizedBox(height: 0.03.sh),

              CustomTextField(
                label: CustomTexts.email,
                hintText: CustomTexts.enteremail,
                prefixIcon: CustomIconsPath.emailPath,
              ),

              SizedBox(height: 0.03.sh),

              CustomPasswordField(
                label: CustomTexts.password,
                hintText: CustomTexts.hint,
                prefixIcon: CustomIconsPath.lockPath,
              ),

              SizedBox(height: 0.03.sh),

              CustomPasswordField(
                label: CustomTexts.confirmpassword,
                hintText: CustomTexts.hint,
                prefixIcon: CustomIconsPath.lockPath,
              ),
              SizedBox(height: 0.06.sh),
              Center(
                child: CustomButton(
                  text: CustomTexts.getstarted,
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 0.02.sh),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    CustomTexts.already,
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 14.sp,
                      color: ThemeColors.kFontGreyColor,
                    ),
                  ),

                  SizedBox(width: 0.02.sw),

                  GestureDetector(
                    onTap: () {
                      ScreenNavigationService.navigationPush(
                        CustomRouter.loginScreenRouteName,
                        replacement: false,
                      );
                    },
                    child: CustomText(
                      CustomTexts.login,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 14.sp,
                        color: ThemeColors.kFontGreenColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
