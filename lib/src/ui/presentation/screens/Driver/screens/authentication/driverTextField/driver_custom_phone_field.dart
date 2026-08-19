import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridex_mobile_app/src/configs/icons/icons.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverCustomPhoneField extends StatelessWidget {
  final TextEditingController? controller;

  const DriverCustomPhoneField({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// Label
        Text(
          'Phone Number',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ThemeColors.kFontBlackColor,
          ),
        ),

        SizedBox(height: 8.h),

        /// Phone Text Field
        TextField(
          controller: controller,
          keyboardType: TextInputType.phone,

          decoration: InputDecoration(
            hintText: 'Enter your phone number',

            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: ThemeColors.kFontGreyColor,
            ),

            /// Phone Icon + Country Code
            prefixIcon: Padding(
              padding: EdgeInsets.only(
                left: 12.w,
                right: 8.w,
              ),

              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  /// Phone Icon
                  SvgPicture.asset(
                    CustomIconsPath.phonePath,
                    width: 16.w,
                    height: 16.h,
                  ),

                  SizedBox(width: 8.w),

                  /// Country Code
                  Text(
                    '+92',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.kFontBlackColor,
                    ),
                  ),

                  SizedBox(width: 8.w),

                  /// Divider
                  Container(
                    height: 24.h,
                    width: 1,
                    color: ThemeColors.kFontGreyColor,
                  ),

                  SizedBox(width: 8.w),
                ],
              ),
            ),

            /// Normal Border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ThemeColors.kFontGreyColor,
              ),
            ),

            /// Enabled Border
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ThemeColors.kFontGreyColor,
              ),
            ),

            /// Focused Border
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ThemeColors.kFontGreenColor,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}