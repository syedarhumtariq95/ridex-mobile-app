import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String driverName;
  final String imagePath;
  final VoidCallback onViewProfileTap;

  const ProfileHeaderWidget({
    super.key,
    required this.driverName,
    required this.imagePath,
    required this.onViewProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: statusBarHeight + 0.02.sh,
        bottom: 0.035.sh,
        left: 0.06.sw,
        right: 0.06.sw,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF5B39A8),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(24.r)),
      ),
      child: Row(
        children: [
          /// Profile Image Avatar
          Container(
            width: 0.20.sw,
            height: 0.20.sw,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: 0.04.sw),

          /// Driver Name and View Profile Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                driverName,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 0.002.sh),
              GestureDetector(
                onTap: onViewProfileTap,
                child: Text(
                  'View Profile',
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
