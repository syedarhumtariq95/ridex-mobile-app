import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/pendingVerification/widgets/pending_verification_header_widget.dart';

import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';

class PendingVerificationScreen extends StatelessWidget {
  const PendingVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw),
          child: Column(
            children: [
              /// Center Content
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: PendingVerificationHeaderWidget(),
                  ),
                ),
              ),

              /// Bottom Button
              DriverCustomButton(
                text: 'Ok',
                onPressed: () {
                  ScreenNavigationService.navigationPush(
                    CustomRouter.driverDashboardScreenRouteName,
                    replacement: false,
                  );
                },
              ),

              SizedBox(height: 0.03.sh),
            ],
          ),
        ),
      ),
    );
  }
}