import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDetail/widgets/custom_dropdown_field.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';
import '../../../../../../configs/theme/theme_colors.dart';
import '../../../../../blocs/driverDetails/driver_details_bloc.dart';
import '../authentication/driverTextField/driver_custom_text_field.dart';

class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({super.key});

  @override
  State<DriverDetailsScreen> createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  String? selectedVehicleType;
  final List<String> vehicleTypes = ['Car', 'Bike', 'Auto Rickshaw'];

  final TextEditingController vehicleModelController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController licenseController = TextEditingController();

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  @override
  void dispose() {
    vehicleModelController.dispose();
    vehicleNumberController.dispose();
    licenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider<DriverDetailsBloc>(
        create: (context) => DI.i<DriverDetailsBloc>(),
        child: BlocConsumer<DriverDetailsBloc, DriverDetailsState>(
          listener: (context, state) {
            if (state is DriverDetailsSuccess) {
              ScreenNavigationService.navigationPush(
                CustomRouter.documentUploadScreenRouteName,
                replacement: false,
              );
            } else if (state is DriverDetailsFailure) {
              print("DRIVER_BLOC_ERROR: ${state.errorMessage}");
              _showError(state.errorMessage);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 0.06.sw, vertical: 0.03.sh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.01.sh),
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
                    DriverCustomTextField(
                      controller: vehicleModelController,
                      label: 'Vehicle Model',
                      hintText: 'e.g. Honda Civic 2022',
                    ),
                    SizedBox(height: 0.02.sh),
                    DriverCustomTextField(
                      controller: vehicleNumberController,
                      label: 'Vehicle Number',
                      hintText: 'e.g. LEB-1234',
                    ),
                    SizedBox(height: 0.02.sh),
                    DriverCustomTextField(
                      controller: licenseController,
                      label: 'Driving License No.',
                      hintText: 'Enter license number (Optional)',
                    ),
                    SizedBox(height: 0.06.sh),
                    Center(
                      child: state is DriverDetailsLoading
                          ? const CircularProgressIndicator(
                        color: ThemeColors.kFontPurpleColor,
                      )
                          : DriverCustomButton(
                        text: 'Next',
                        onPressed: () {
                          if (selectedVehicleType == null) {
                            _showError('Please select a vehicle type');
                            return;
                          }
                          if (vehicleModelController.text.trim().isEmpty) {
                            _showError('Please enter vehicle model');
                            return;
                          }
                          if (vehicleNumberController.text.trim().isEmpty) {
                            _showError('Please enter vehicle number');
                            return;
                          }

                          // Fetch single instance via Context
                          context.read<DriverDetailsBloc>().add(
                            SubmitDriverDetailsEvent(
                              vehicleType: selectedVehicleType!,
                              vehicleModel: vehicleModelController.text.trim(),
                              vehicleNumber: vehicleNumberController.text.trim(),
                              licenseNumber: licenseController.text.trim(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}