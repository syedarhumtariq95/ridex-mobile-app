import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import 'widgets/customer_rating_widget.dart';
import 'widgets/fare_and_payment_card_widget.dart';

class TripCompletedScreen extends StatelessWidget {
  const TripCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            children: [
              SizedBox(height: 0.04.sh),

              /// Top Green Check Circle Icon
              Container(
                width: 0.30.sw,
                height: 0.30.sw,
                decoration: BoxDecoration(
                  color: ThemeColors.kFontGreenColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 80.sp,
                  ),
                ),
              ),

              SizedBox(height: 0.02.sh),

              /// Trip Completed Title
              Text(
                'Trip Completed!',
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w800,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),

              SizedBox(height: 0.05.sh),

              /// Total Fare and Payment Method Box
              FareAndPaymentCardWidget(
                totalFare: '450',
                paymentMethod: 'Cash',
              ),

              Spacer(),

              /// Rate Customer Stars
              CustomerRatingWidget(
                onRatingChanged: (rating) {
                  // Rating selection handler
                },
              ),

              SizedBox(height: 0.03.sh),

              /// Bottom Done Action Button
              DriverCustomButton(
                text: 'Done',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              SizedBox(height: 0.06.sh),
            ],
          ),
        ),
      ),
    );
  }
}