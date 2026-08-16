import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/liveTracking/widgets/driver_action_buttons_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/liveTracking/widgets/driver_info_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/liveTracking/widgets/driver_status_strip_widget.dart';

import '../../../../configs/images/images.dart';

class LiveTrackingScreen extends StatelessWidget {
  LiveTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Background Map Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 0.78.sh,
            child: Image.asset(
              CustomImagesPath.maplocationImagePath,
              fit: BoxFit.cover,
            ),
          ),

          /// Top Floating Back Button
          Positioned(
            top: 0.06.sh,
            left: 0.05.sw,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 0.12.sw,
                height: 0.12.sw,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10.r,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 18.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          /// Bottom Full-Width Card Sheet
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05.sw,
                vertical: 0.09.sh,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15.r,
                    spreadRadius: 3,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Driver Details Header
                  DriverInfoWidget(),

                  SizedBox(height: 0.02.sh),

                  /// Chat & Call Buttons
                  DriverActionButtonsWidget(
                    onChatTap: () {
                      // Open Chat Action
                    },
                    onCallTap: () {
                      // Call Driver Action
                    },
                  ),

                  SizedBox(height: 0.015.sh),

                  /// Bottom Status Indicator
                  DriverStatusStripWidget(),

                  SizedBox(height: 0.01.sh),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
