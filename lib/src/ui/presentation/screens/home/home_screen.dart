import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/images/images.dart';
import '../../../../configs/theme/theme_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          /// Background Map Image
          SizedBox(
            width: double.infinity,
            height: 0.4.sh,
            child: Image.asset(
              CustomImagesPath.mapImagePath,
              fit: BoxFit.cover,
            ),
          ),


          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05.sw,
                vertical: 0.02.sh,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                    child: const Center(
                      child: Icon(Icons.menu),
                    ),
                  ),

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
                    child: const Center(
                      child: Icon(Icons.notifications),
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