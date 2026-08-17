import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class EarningsFilterDropdownWidget extends StatefulWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const EarningsFilterDropdownWidget({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  State<EarningsFilterDropdownWidget> createState() =>
      _EarningsFilterDropdownWidgetState();
}

class _EarningsFilterDropdownWidgetState
    extends State<EarningsFilterDropdownWidget> {
  final List<String> _filters = [
    'Today',
    'This Week',
    'This Month',
    'This Year',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.045.sw,
        vertical: 0.01.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectedFilter,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ThemeColors.kFontBlackColor,
            size: 24.sp,
          ),
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ThemeColors.kFontBlackColor,
          ),
          isDense: true,
          onChanged: (String? newValue) {
            if (newValue != null) {
              widget.onFilterChanged(newValue);
            }
          },
          items: _filters.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}