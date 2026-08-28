import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import 'widgets/customer_rating_widget.dart';
import 'widgets/fare_and_payment_card_widget.dart';

class TripCompletedScreen extends StatefulWidget {
  final Map<String, dynamic>? rideData;

  const TripCompletedScreen({super.key, this.rideData});

  @override
  State<TripCompletedScreen> createState() => _TripCompletedScreenState();
}

class _TripCompletedScreenState extends State<TripCompletedScreen> {
  int _rating = 5;

  void _finishAndGoHome() {
    if (mounted) {
      // Clean return back to Driver Dashboard Root
      Navigator.popUntil(context, (route) => route.isFirst);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic values extracted directly from Supabase DB payload
    final String fare = widget.rideData?['fare']?.toString() ?? '0';
    final String paymentMethod =
        widget.rideData?['payment_method']?.toString() ?? 'Cash';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            children: [
              SizedBox(height: 0.04.sh),
              Container(
                width: 0.30.sw,
                height: 0.30.sw,
                decoration: const BoxDecoration(
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

              /// Dynamic Fare and Payment Method Card
              FareAndPaymentCardWidget(
                totalFare: fare,
                paymentMethod: paymentMethod,
              ),

              const Spacer(),

              CustomerRatingWidget(
                onRatingChanged: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
              SizedBox(height: 0.03.sh),

              DriverCustomButton(
                text: 'Done',
                onPressed: _finishAndGoHome,
              ),
              SizedBox(height: 0.06.sh),
            ],
          ),
        ),
      ),
    );
  }
}