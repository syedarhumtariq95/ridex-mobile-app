import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import '../../../../../../../configs/images/images.dart';

class RideRequestMapWidget extends StatelessWidget {
  final String distance;

  const RideRequestMapWidget({
    super.key,
    required this.distance,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      height: 0.45.sh,
      child: Stack(
        children: [
          /// Background Map Image (Thora Neeche Positioned)
          Positioned(
            top: statusBarHeight + 0.05.sh,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              CustomImagesPath.maplocationImagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Header Box (With Radius & Larger Font Sizes)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: statusBarHeight + 0.012.sh,
                bottom: 0.02.sh,
                left: 0.06.sw,
                right: 0.06.sw,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'New Ride Request',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w800,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),
                  SizedBox(height: 0.004.sh),
                  Text(
                    '$distance away',
                    style: TextStyle(
                      fontFamily: FontsConfigs.poppinsFonts,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: ThemeColors.kFontGreyColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}