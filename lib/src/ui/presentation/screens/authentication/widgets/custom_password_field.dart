import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class CustomPasswordField extends StatefulWidget {
  final String label;
  final String hintText;
  final String? prefixIcon;
  final TextEditingController? controller;

  const CustomPasswordField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.controller,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ThemeColors.kFontBlackColor,
          ),
        ),

        SizedBox(height: 8.h),

        TextField(
          controller: widget.controller,
          obscureText: isObscure,

          decoration: InputDecoration(
            hintText: widget.hintText,

            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: ThemeColors.kFontGreyColor,
            ),

            prefixIcon: widget.prefixIcon != null
                ? Padding(
              padding: EdgeInsets.all(12.w),
              child: SvgPicture.asset(
                widget.prefixIcon!,
                width: 26.w,
                height: 26.h,
              ),
            )
                : null,

            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(
                isObscure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ThemeColors.kFontGreyColor,
              ),
            ),

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