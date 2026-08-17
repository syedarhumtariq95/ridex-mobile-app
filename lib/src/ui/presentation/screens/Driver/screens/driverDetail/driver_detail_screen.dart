import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDetail/widgets/custom_dropdown_field.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';
import '../../../../../../configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/widgets/custom_text_field.dart';

import '../authentication/driverTextField/driver_custom_text_field.dart';

class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({super.key});

  @override
  State<DriverDetailsScreen> createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  String? selectedVehicleType;

  final List<String> vehicleTypes = ['Car', 'Bike', 'Auto Rickshaw'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 0.06.sw, vertical: 0.03.sh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.01.sh),

              /// Header Title
              Center(
                child: Text(
                  'Driver Details',
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.kFontBlackColor,
                  ),
                ),
              ),

              SizedBox(height: 0.04.sh),

              /// Vehicle Type Dropdown
              CustomDropdownField(
                label: 'Vehicle Type',
                hintText: 'Select',
                selectedValue: selectedVehicleType,
                items: vehicleTypes,
                onChanged: (value) {
                  setState(() {
                    selectedVehicleType = value;
                  });
                },
              ),

              SizedBox(height: 0.02.sh),

              /// Vehicle Model Input
              DriverCustomTextField(
                label: 'Vehicle Model',
                hintText: 'e.g. Honda Civic 2022',
              ),

              SizedBox(height: 0.02.sh),

              /// Vehicle Number Input
              DriverCustomTextField(
                label: 'Vehicle Number',
                hintText: 'e.g. LEB-1234',
              ),

              SizedBox(height: 0.02.sh),

              /// Driving License No. Input
              DriverCustomTextField(
                label: 'Driving License No.',
                hintText: 'Enter license number',
              ),

              SizedBox(height: 0.06.sh),

              /// Next Button
              Center(
                child: DriverCustomButton(
                  text: 'Next',
                  onPressed: () {
                    ScreenNavigationService.navigationPush(
                      CustomRouter.documentUploadScreenRouteName,
                      replacement: false,
                    );
                  },
                ),
              ),

              SizedBox(height: 0.02.sh),
            ],
          ),
        ),
      ),
    );
  }
}
