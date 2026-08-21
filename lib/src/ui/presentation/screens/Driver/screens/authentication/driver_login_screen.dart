import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/driver_custom_button.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import 'package:ridex_mobile_app/src/configs/router/screen_navigation_service.dart';
import 'package:ridex_mobile_app/src/configs/texts/texts.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../../../../configs/validator/validators.dart';
import '../../../../../blocs/authentication/authentication_bloc.dart';
import '../../../../../generics/widgets/text/custom_text.dart';
import 'driverTextField/driver_custom_text_field.dart';

class DriverLoginScreen extends StatefulWidget {
  const DriverLoginScreen({super.key});

  @override
  State<DriverLoginScreen> createState() => _DriverLoginScreenState();
}

class _DriverLoginScreenState extends State<DriverLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: DI.i<AuthenticationBloc>(),
        listener: (context, state) {
          if (state is UserLoginSuccess) {
            ScreenNavigationService.navigationPush(
              CustomRouter.driverDetailScreenRouteName,
              replacement: true,
            );
          } else if (state is AuthenticationFailure) {
            _showError(state.errorMessage);
          }
        },
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.05.sh),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.01.sh),
                CustomText(
                  CustomTexts.welcome,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 32.sp,
                    color: ThemeColors.kFontBlackColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 0.01.sh),
                CustomText(
                  CustomTexts.logintocontinue,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 20.sp,
                    color: ThemeColors.kFontGreyColor,
                  ),
                ),
                SizedBox(height: 0.04.sh),
                DriverCustomTextField(
                  controller: emailController,
                  label: CustomTexts.emailaddress,
                  hintText: CustomTexts.enteremail,
                  prefixIcon: CustomIconsPath.emailPath,
                ),
                SizedBox(height: 0.03.sh),
                DriverCustomTextField(
                  controller: passwordController,
                  label: CustomTexts.password,
                  hintText: CustomTexts.hint,
                  prefixIcon: CustomIconsPath.lockPath,
                ),
                SizedBox(height: 0.03.sh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ScreenNavigationService.navigationPush(
                          CustomRouter.onboardingScreenRouteName,
                          replacement: false,
                        );
                      },
                      child: CustomText(
                        CustomTexts.forgotpassword,
                        style: TextStyle(
                          fontFamily: FontsConfigs.poppinsFonts,
                          fontSize: 14.sp,
                          color: ThemeColors.kFontPurpleColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 0.06.sh),
                Center(
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    bloc: DI.i<AuthenticationBloc>(),
                    builder: (context, state) {
                      if (state is AuthenticationLoading) {
                        return const CircularProgressIndicator(color: ThemeColors.kFontPurpleColor);
                      }
                      return DriverCustomButton(
                        text: CustomTexts.login,
                        onPressed: () {
                          final emailError = AppValidators.validateEmail(emailController.text);
                          if (emailError != null) {
                            _showError(emailError);
                            return;
                          }

                          final passwordError = AppValidators.validatePassword(passwordController.text);
                          if (passwordError != null) {
                            _showError(passwordError);
                            return;
                          }

                          DI.i<AuthenticationBloc>().add(
                            LoginUserWithEmailRequested(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              remember: true,
                              expectedRole: 'driver',
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 0.02.sh),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      CustomTexts.donthave,
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
                          CustomRouter.driverSignupScreenRouteName,
                          replacement: false,
                        );
                      },
                      child: CustomText(
                        CustomTexts.signup,
                        style: TextStyle(
                          fontFamily: FontsConfigs.poppinsFonts,
                          fontSize: 14.sp,
                          color: ThemeColors.kFontPurpleColor,
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
      ),
    );
  }
}