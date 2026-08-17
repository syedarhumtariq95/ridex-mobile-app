import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class RideRequestDetailsCardWidget extends StatelessWidget {
  final String pickupLocation;
  final String dropLocation;
  final String fare;

  const RideRequestDetailsCardWidget({
    super.key,
    required this.pickupLocation,
    required this.dropLocation,
    required this.fare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.05.sw,
        vertical: 0.022.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Timeline Dots and Locations
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Timeline Dots & Line (Bada Circle aur Thicker Line)
              Column(
                children: [
                  SizedBox(height: 0.003.sh),
                  Container(
                    width: 0.045.sw,
                    height: 0.045.sw,
                    decoration: BoxDecoration(
                      color: ThemeColors.kFontGreenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 2.5,
                    height: 0.065.sh,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                    width: 0.045.sw,
                    height: 0.045.sw,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade600,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 0.045.sw),

              /// Pickup and Drop Titles + Subtitles
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 14.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.002.sh),
                    Text(
                      pickupLocation,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.kFontBlackColor,
                      ),
                    ),
                    SizedBox(height: 0.022.sh),
                    Text(
                      'Drop',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 14.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.002.sh),
                    Text(
                      dropLocation,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.kFontBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 0.02.sh),
          Divider(color: Colors.grey.shade200, thickness: 1),
          SizedBox(height: 0.012.sh),

          /// Estimated Fare Section
          Text(
            'Estimated Fare',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: ThemeColors.kFontGreyColor,
            ),
          ),
          SizedBox(height: 0.004.sh),
          Text(
            'PKR $fare',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 26.sp,
              fontWeight: FontWeight.w800,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
        ],
      ),
    );
  }
}