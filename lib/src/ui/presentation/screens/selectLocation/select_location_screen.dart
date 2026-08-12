import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/selectLocation/widgets/location_map_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/selectLocation/widgets/save_location_places_widget.dart';

import '../../../../configs/router/routes.dart';
import '../../../../configs/router/screen_navigation_service.dart';
import '../../../../configs/texts/texts.dart';

class SelectLocationScreen extends StatelessWidget {
  SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          LocationMapWidget(),
          SizedBox(height: 0.04.sh),
          SaveLocationPlacesWidget(),
          SizedBox(height: 0.04.sh),
          Center(
            child: CustomButton(
              text: CustomTexts.confirmlocation,
              onPressed: () {
                ScreenNavigationService.navigationPush(
                  CustomRouter.rideOptionScreenRouteName,
                  replacement: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
