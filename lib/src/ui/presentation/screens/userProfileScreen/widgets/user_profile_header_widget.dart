import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';

class UserProfileHeaderWidget extends StatelessWidget {
  final String userName;
  final String imagePath;
  final VoidCallback onViewProfileTap;
  final VoidCallback onBackTap;

  const UserProfileHeaderWidget({
    super.key,
    required this.userName,
    required this.imagePath,
    required this.onViewProfileTap,
    required this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: statusBarHeight + 0.015.sh,
          bottom: 0.035.sh,
          left: 0.06.sw,
          right: 0.06.sw,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF2FA84F), // User Side Green Theme Color
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(24.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Top Back Arrow
            GestureDetector(
              onTap: onBackTap,
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: EdgeInsets.only(bottom: 0.02.sh),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 26.sp,
                ),
              ),
            ),

            /// Profile Row (Avatar + Details)
            Row(
              children: [
                /// Avatar Profile Picture
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

                /// Name and View Profile Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      userName,
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
          ],
        ),
      ),
    );
  }
}