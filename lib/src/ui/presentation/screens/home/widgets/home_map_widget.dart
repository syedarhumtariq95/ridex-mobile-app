import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';

import '../../../../../configs/images/images.dart';
import '../../../../../configs/theme/theme_colors.dart';
import '../../userProfileScreen/user_profile_screen.dart';
import 'location_search_widget.dart';

class HomeMapWidget extends StatelessWidget {
  const HomeMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 0.44.sh,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          /// Map
          SizedBox(
            width: double.infinity,
            height: 0.40.sh,
            child: Image.asset(
              CustomImagesPath.mapImagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          /// Top Buttons
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05.sw,
                vertical: 0.02.sh,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Menu Button
                  /// Menu Button inside HomeMapWidget
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserProfileScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 0.06.sh,
                      width: 0.13.sw,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: ThemeColors.kFontGreyColor,
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: CustomIcons(iconPath: CustomIconsPath.menuPath),
                      ),
                    ),
                  ),

                  /// Notification Button
                  Container(
                    height: 0.06.sh,
                    width: 0.13.sw,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: ThemeColors.kBorderGreyColor,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: CustomIcons(iconPath: CustomIconsPath.searchPath),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Where To
          Positioned(
            left: 0.05.sw,
            right: 0.05.sw,
            top: 0.32.sh,
            child: LocationSearchWidget(),
          ),
        ],
      ),
    );
  }
}