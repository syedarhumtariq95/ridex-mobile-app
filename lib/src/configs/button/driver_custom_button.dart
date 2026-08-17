import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverCustomButton extends StatelessWidget {
  const DriverCustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.height,
    this.color = ThemeColors.kFontPurpleColor,
    this.textColor = Colors.white,
    this.borderRadius,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.padding,
  });

  final String text;
  final VoidCallback onPressed;
  final double? width;
  final double? height;
  final Color color;
  final Color textColor;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0.9.sw,
      height: height ?? 60.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 0,
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? 20.r,
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize ?? 20.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}