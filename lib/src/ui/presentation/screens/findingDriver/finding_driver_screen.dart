import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/findingDriver/widgets/finding_driver_radar_widget.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/findingDriver/widgets/finding_driver_text_widget.dart';

import '../../../../configs/button/custom_button_second.dart';
import '../../../../configs/router/routes.dart';
import '../../../../configs/router/screen_navigation_service.dart';
import '../../../../configs/texts/texts.dart';

class FindingDriverScreen extends StatelessWidget {
  FindingDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            children: [
              /// Exact Screen Center Block
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FindingDriverRadarWidget(),
                      SizedBox(height: 0.03.sh),
                      FindingDriverTextWidget(),
                    ],
                  ),
                ),
              ),

              /// Bottom Button Section with Proper Gap
              CustomButtonSecond(
                text: CustomTexts.cancelride,
                onPressed: () {
                  ScreenNavigationService.navigationPush(
                    CustomRouter.liveTrackingScreenRouteName,
                    replacement: false,
                  );
                },
              ),

              SizedBox(height: 0.02.sh),
            ],
          ),
        ),
      ),
    );
  }
}
