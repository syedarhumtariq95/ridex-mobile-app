import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';

class NavigationTopHeaderWidget extends StatelessWidget {
  final String title;
  final String location;

  const NavigationTopHeaderWidget({
    super.key,
    required this.title,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: statusBarHeight + 0.015.sh,
        bottom: 0.02.sh,
        left: 0.05.sw,
        right: 0.05.sw,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF1E2738),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.north,
            color: Colors.white,
            size: 32.sp,
          ),
          SizedBox(width: 0.04.sw),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 0.002.sh),
                Text(
                  location,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}