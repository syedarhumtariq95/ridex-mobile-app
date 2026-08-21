import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import 'package:ridex_mobile_app/src/configs/router/screen_navigation_service.dart';
import 'package:ridex_mobile_app/src/configs/texts/texts.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/widgets/custom_password_field.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/widgets/custom_phone_field.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/widgets/custom_text_field.dart';

import '../../../../configs/validator/validators.dart';
import '../../../blocs/authentication/authentication_bloc.dart';
import '../../../generics/widgets/text/custom_text.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

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
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: DI.i<AuthenticationBloc>(),
        listener: (context, state) {
          if (state is UserRegisteredSuccess) {
            ScreenNavigationService.navigationPush(
              CustomRouter.homeScreenRouteName,
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
                  controller: fullNameController,
                  label: CustomTexts.fullname,
                  hintText: CustomTexts.enterfullname,
                  prefixIcon: CustomIconsPath.profilePath,
                ),
                SizedBox(height: 0.03.sh),
                CustomPhoneField(controller: phoneController),
                SizedBox(height: 0.03.sh),
                CustomTextField(
                  controller: emailController,
                  label: CustomTexts.email,
                  hintText: CustomTexts.enteremail,
                  prefixIcon: CustomIconsPath.emailPath,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 0.03.sh),
                CustomPasswordField(
                  controller: passwordController,
                  label: CustomTexts.password,
                  hintText: CustomTexts.hint,
                  prefixIcon: CustomIconsPath.lockPath,
                ),
                SizedBox(height: 0.03.sh),
                CustomPasswordField(
                  controller: confirmPasswordController,
                  label: CustomTexts.confirmpassword,
                  hintText: CustomTexts.hint,
                  prefixIcon: CustomIconsPath.lockPath,
                ),
                SizedBox(height: 0.06.sh),
                Center(
                  child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    bloc: DI.i<AuthenticationBloc>(),
                    builder: (context, state) {
                      if (state is AuthenticationLoading) {
                        return const CircularProgressIndicator(color: ThemeColors.kFontGreenColor);
                      }
                      return CustomButton(
                        text: CustomTexts.getstarted,
                        onPressed: () {
                          final nameError = AppValidators.validateName(fullNameController.text);
                          if (nameError != null) {
                            _showError(nameError);
                            return;
                          }

                          final phoneError = AppValidators.validatePhone(phoneController.text);
                          if (phoneError != null) {
                            _showError(phoneError);
                            return;
                          }

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

                          final confirmPasswordError = AppValidators.validateConfirmPassword(
                            confirmPasswordController.text,
                            passwordController.text,
                          );
                          if (confirmPasswordError != null) {
                            _showError(confirmPasswordError);
                            return;
                          }

                          DI.i<AuthenticationBloc>().add(
                            RegisterUserRequested(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              fullName: fullNameController.text.trim(),
                              phone: phoneController.text.trim(),
                              role: 'customer',
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
      ),
    );
  }
}