import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class RideDetailsCardWidget extends StatelessWidget {
  final String pickupLocation;
  final String dropLocation;
  final String distance;
  final String fare;

  const RideDetailsCardWidget({
    super.key,
    required this.pickupLocation,
    required this.dropLocation,
    required this.distance,
    required this.fare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.06.sw,
        vertical: 0.025.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Pickup Location Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: ThemeColors.kFontGreenColor,
                size: 26.sp,
              ),
              SizedBox(width: 0.03.sw),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 13.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.002.sh),
                    Text(
                      pickupLocation,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 16.sp,
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

          /// Drop Location Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.indigo,
                size: 26.sp,
              ),
              SizedBox(width: 0.03.sw),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drop',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 13.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.002.sh),
                    Text(
                      dropLocation,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 16.sp,
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
          SizedBox(height: 0.015.sh),

          /// Distance & Fare Side-by-Side Row
          Row(
            children: [
              /// Distance Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distance',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 13.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.004.sh),
                    Text(
                      distance,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: ThemeColors.kFontBlackColor,
                      ),
                    ),
                  ],
                ),
              ),

              /// Fare Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fare',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 13.sp,
                        color: ThemeColors.kFontGreyColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.004.sh),
                    Text(
                      'PKR $fare',
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w800,
                        color: ThemeColors.kFontBlackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}