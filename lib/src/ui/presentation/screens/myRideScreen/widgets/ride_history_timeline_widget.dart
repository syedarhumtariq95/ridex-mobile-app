import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class RideHistoryTimelineWidget extends StatelessWidget {
  RideHistoryTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Pickup Green Dot
        Container(
          width: 0.022.sw,
          height: 0.022.sw,
          decoration: BoxDecoration(
            color: ThemeColors.kFontGreenColor,
            shape: BoxShape.circle,
          ),
        ),

        /// Connecting Vertical Line
        Container(width: 1.5, height: 0.035.sh, color: Colors.grey.shade300),

        /// Destination Marker Icon / Orange Dot
        Container(
          width: 0.022.sw,
          height: 0.022.sw,
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
