import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import 'package:ridex_mobile_app/src/configs/router/screen_navigation_service.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/selectRole/widgets/account_type_card_widget.dart';

class ChooseAccountTypeScreen extends StatefulWidget {
  const ChooseAccountTypeScreen({super.key});

  @override
  State<ChooseAccountTypeScreen> createState() =>
      _ChooseAccountTypeScreenState();
}

class _ChooseAccountTypeScreenState extends State<ChooseAccountTypeScreen> {

  int selectedAccountType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            children: [
              SizedBox(height: 0.05.sh),

              /// Header Title Section
              Text(
                'I want to use\nRideX as',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: ThemeColors.kFontBlackColor,
                  height: 1.3,
                ),
              ),

              SizedBox(height: 0.05.sh),

              /// Customer Card Option
              AccountTypeCardWidget(
                title: 'Customer',
                subtitle: 'Book a ride',
                icon: Icons.person_rounded,
                isSelected: selectedAccountType == 0,
                onTap: () {
                  setState(() {
                    selectedAccountType = 0;
                  });
                },
              ),

              SizedBox(height: 0.02.sh),

              /// Driver Card Option
              AccountTypeCardWidget(
                title: 'Driver',
                subtitle: 'Drive & earn',
                icon: Icons.directions_car_filled_rounded,
                isSelected: selectedAccountType == 1,
                onTap: () {
                  setState(() {
                    selectedAccountType = 1;
                  });
                },
              ),

              const Spacer(),

              /// Continue Button with Conditional Navigation
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  if (selectedAccountType == 0) {

                    ScreenNavigationService.navigationPush(
                      CustomRouter.loginScreenRouteName,
                      replacement: false,
                    );
                  } else {

                    ScreenNavigationService.navigationPush(
                      CustomRouter.driverLoginScreenRouteName,
                      replacement: false,
                    );
                  }
                },
              ),

              SizedBox(height: 0.03.sh),
            ],
          ),
        ),
      ),
    );
  }
}