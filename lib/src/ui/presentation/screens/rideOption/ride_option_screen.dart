import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideOption/widgets/payment_method_card.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideOption/widgets/ride_option_card.dart';

import '../../../../configs/button/custom_button.dart';
import '../../../../configs/router/routes.dart';
import '../../../../configs/router/screen_navigation_service.dart';
import '../../../../configs/texts/texts.dart';
import 'enum/enum.dart';

class RideOptionScreen extends StatefulWidget {
  RideOptionScreen({super.key});

  @override
  State<RideOptionScreen> createState() => _RideOptionScreenState();
}

class _RideOptionScreenState extends State<RideOptionScreen> {
  RideType selectedRide = RideType.economy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Column(
            children: [
              SizedBox(height: 0.02.sh),

              /// Upper Center Text
              Align(
                alignment: Alignment.center,
                child: Text(
                  CustomTexts.choosearide,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: ThemeColors.kFontBlackColor,
                  ),
                ),
              ),

              SizedBox(height: 0.025.sh),

              /// Ride Options List & Payment Options in Scrollable View
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: RideType.values.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 0.015.sh),
                        itemBuilder: (context, index) {
                          final rideType = RideType.values[index];
                          final isSelected = selectedRide == rideType;

                          return RideOptionCard(
                            rideType: rideType,
                            isSelected: isSelected,
                            onTap: () {
                              setState(() {
                                selectedRide = rideType;
                              });
                            },
                          );
                        },
                      ),

                      SizedBox(height: 0.025.sh),

                      /// Payment Option
                      PaymentMethodCard(),

                      SizedBox(height: 0.01.sh),
                    ],
                  ),
                ),
              ),

              /// BottomButton
              Center(
                child: CustomButton(
                  text: CustomTexts.confirmride,
                  onPressed: () {
                    ScreenNavigationService.navigationPush(
                      CustomRouter.findingDriverScreenRouteName,
                      replacement: false,
                    );
                  },
                ),
              ),
              SizedBox(height: 0.04.sh),
            ],
          ),
        ),
      ),
    );
  }
}