import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';
import 'widgets/ride_details_card_widget.dart';
import 'widgets/ride_details_map_widget.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Full Screen Edge-To-Edge Map View
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(child: RideDetailsMapWidget()),

                /// Overlay Details Card At Bottom
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: RideDetailsCardWidget(
                    pickupLocation: 'Gulberg 3, Lahore',
                    dropLocation: 'Packages Mall',
                    distance: '12.4 km',
                    fare: '450',
                  ),
                ),
              ],
            ),
          ),

          /// Bottom Action Button Container
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 0.05.sw,
              vertical: 0.018.sh,
            ),
            child: DriverCustomButton(text: 'Start Ride', onPressed: () {
              ScreenNavigationService.navigationPush(
                CustomRouter.navigationScreenRouteName,
                replacement: false,
              );
            }),
          ),
          SizedBox(height: 0.06.sh),
        ],
      ),
    );
  }
}
