import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button_second.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/newRideRequest/widgets/ride_request_details_card_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/newRideRequest/widgets/ride_request_map_widget.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';

class NewRideRequestScreen extends StatelessWidget {
  const NewRideRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Full Width Top Map Container (Zero Side & Top Padding)
          RideRequestMapWidget(distance: '1.2 km'),

          /// Bottom Pickup/Drop & Fare Card with Side Padding
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.02.sh),
              child: RideRequestDetailsCardWidget(
                pickupLocation: 'Gulberg 3, Lahore',
                dropLocation: 'Packages Mall',
                fare: '450',
              ),
            ),
          ),

          /// Action Buttons
          Padding(
            padding: EdgeInsets.only(
              left: 0.05.sw,
              right: 0.05.sw,
              bottom: 0.02.sh,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButtonSecond(
                    text: 'Reject',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 0.04.sw),
                Expanded(
                  child: DriverCustomButton(
                    text: 'Accept',
                    onPressed: () {
                      ScreenNavigationService.navigationPush(
                        CustomRouter.rideDetailsScreenRouteName,
                        replacement: false,
                      );
                    },
                  ),
                ),

              ],
            ),

          ),
          SizedBox(height: 0.04.sh),
        ],
      ),
    );
  }
}