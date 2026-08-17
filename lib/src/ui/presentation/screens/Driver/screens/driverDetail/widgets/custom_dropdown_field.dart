import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class CustomDropdownField extends StatelessWidget {
  final String label;
  final String hintText;
  final String? selectedValue;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  const CustomDropdownField({
    super.key,
    required this.label,
    required this.hintText,
    required this.items,
    required this.onChanged,
    this.selectedValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ThemeColors.kFontBlackColor,
          ),
        ),
        SizedBox(height: 0.008.sh),
        DropdownButtonFormField<String>(
          value: selectedValue,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ThemeColors.kFontGreyColor,
            size: 24.sp,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 14.sp,
              color: Colors.grey.shade400,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 0.04.sw,
              vertical: 0.018.sh,
            ),
            filled: true,
            fillColor: Colors.grey.shade50,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide( color: ThemeColors.kFontGreyColor,),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                color: ThemeColors.kFontGreyColor,
                width: 1.5,
              ),
            ),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 14.sp,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ],
    );
  }
}