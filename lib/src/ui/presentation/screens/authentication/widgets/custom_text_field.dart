import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ThemeColors.kFontBlackColor,
          ),
        ),

        SizedBox(height: 8.h),

        TextField(
          controller: controller,
          keyboardType: keyboardType,

          decoration: InputDecoration(
            hintText: hintText,

            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: ThemeColors.kFontGreyColor,
            ),

            prefixIcon: prefixIcon != null
                ? Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                prefixIcon!,
                width: 16.w,
                height: 16.h,
              ),
            )
                : null,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ThemeColors.kFontGreyColor,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ThemeColors.kFontGreyColor,
              ),
            ),

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