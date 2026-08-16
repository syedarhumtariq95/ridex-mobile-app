import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button_second.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideCompleted/widgets/fare_details_card_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideCompleted/widgets/payment_method_tile_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideCompleted/widgets/ride_completed_header_widget.dart';

import '../../../../configs/router/routes.dart';
import '../../../../configs/router/screen_navigation_service.dart';

class RideCompletedScreen extends StatelessWidget {
  RideCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            children: [
              /// Middle Centered Content
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// Success Header
                        RideCompletedHeaderWidget(),

                        SizedBox(height: 0.04.sh),

                        /// Total Fare Card
                        FareDetailsCardWidget(amount: '450'),

                        SizedBox(height: 0.018.sh),

                        /// Payment Selector Tile
                        PaymentMethodTileWidget(paymentMethod: 'Cash'),
                      ],
                    ),
                  ),
                ),
              ),

              /// Bottom Buttons Section
              CustomButton(
                text: 'Rate Driver',
                onPressed: () {
                  ScreenNavigationService.navigationPush(
                    CustomRouter.myRidesScreenRouteName,
                    replacement: false,
                  );
                },
              ),

              SizedBox(height: 0.015.sh),

              CustomButtonSecond(text: 'Done', onPressed: () {}),

              SizedBox(height: 0.02.sh),
            ],
          ),
        ),
      ),
    );
  }
}
