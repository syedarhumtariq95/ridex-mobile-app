import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class CustomerRatingWidget extends StatefulWidget {
  final ValueChanged<int> onRatingChanged;

  const CustomerRatingWidget({
    super.key,
    required this.onRatingChanged,
  });

  @override
  State<CustomerRatingWidget> createState() => _CustomerRatingWidgetState();
}

class _CustomerRatingWidgetState extends State<CustomerRatingWidget> {
  int _selectedRating = 5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Rate Customer',
          style: TextStyle(
            fontFamily: FontsConfigs.poppinsFonts,
            fontSize: 22.sp,
            fontWeight: FontWeight.w600,
            color: ThemeColors.kFontGreyColor,
          ),
        ),
        SizedBox(height: 0.01.sh),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            final int starValue = index + 1;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedRating = starValue;
                });
                widget.onRatingChanged(_selectedRating);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.015.sw),
                child: Icon(
                  Icons.star,
                  size: 60.sp,
                  color: starValue <= _selectedRating
                      ? Colors.amber.shade600
                      : Colors.grey.shade300,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}