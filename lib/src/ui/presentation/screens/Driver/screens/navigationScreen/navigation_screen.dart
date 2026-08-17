import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../configs/images/images.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';
import 'widgets/navigation_bottom_bar_widget.dart';
import 'widgets/navigation_instruction_card_widget.dart';
import 'widgets/navigation_top_header_widget.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [

          Positioned.fill(
            child: Image.asset(
              CustomImagesPath.maplocationImagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Top Direction Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavigationTopHeaderWidget(
              title: 'Head to Pickup',
              location: 'Gulberg 3, Lahore',
            ),
          ),

          /// Center / Bottom Content Controls
          Positioned(
            left: 0.05.sw,
            right: 0.05.sw,
            bottom: 0.03.sh,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Turn Instruction Box
                NavigationInstructionCardWidget(
                  distance: '850 m',
                  instruction: 'Turn right',
                ),

                SizedBox(height: 0.015.sh),

                /// Bottom Trip Status Bar
                NavigationBottomBarWidget(
                  time: '12 min',
                  distance: '4.2 km',
                  onNavigateTap: () {
                    ScreenNavigationService.navigationPush(
                      CustomRouter.tripCompletedScreenRouteName,
                      replacement: false,
                    );
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
