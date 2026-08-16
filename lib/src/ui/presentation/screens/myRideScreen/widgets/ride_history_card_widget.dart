import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/myRideScreen/widgets/ride_history_timeline_widget.dart';

class RideHistoryCardWidget extends StatelessWidget {
  final String pickupLocation;
  final String dropoffLocation;
  final String dateAndTime;
  final String price;

  RideHistoryCardWidget({
    super.key,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.dateAndTime,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.018.sh),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(18.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Timeline Dots & Line
              Padding(
                padding: EdgeInsets.only(top: 0.005.sh),
                child: RideHistoryTimelineWidget(),
              ),

              SizedBox(width: 0.035.sw),

              /// Locations and Date Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Pickup Location
                    Text(
                      pickupLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ThemeColors.kFontBlackColor,
                      ),
                    ),

                    SizedBox(height: 0.018.sh),

                    /// Dropoff Location
                    Text(
                      dropoffLocation,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: ThemeColors.kFontGreyColor,
                      ),
                    ),

                    SizedBox(height: 0.012.sh),

                    /// Date & Time Stamp
                    Text(
                      dateAndTime,
                      style: TextStyle(
                        fontFamily: FontsConfigs.poppinsFonts,
                        fontSize: 11.sp,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          /// Price Tag Bottom Right Alignment
          Positioned(
            bottom: 0,
            right: 0,
            child: Text(
              'PKR $price',
              style: TextStyle(
                fontFamily: FontsConfigs.poppinsFonts,
                fontSize: 14.sp,
                fontWeight: FontWeight.w800,
                color: ThemeColors.kFontBlackColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
