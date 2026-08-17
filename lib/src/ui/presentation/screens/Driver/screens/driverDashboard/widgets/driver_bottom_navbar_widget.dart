import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DriverBottomNavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const DriverBottomNavbarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    final navItems = [
      {'label': 'Home', 'icon': Icons.home_rounded},
      {'label': 'Earnings', 'icon': Icons.account_balance_wallet_outlined},
      {'label': 'Profile', 'icon': Icons.person_outline_rounded},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 0.01.sh),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(navItems.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () => onTabSelected(index),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  navItems[index]['icon'] as IconData,
                  size: 28.sp,
                  color: isSelected
                      ? ThemeColors.kFontPurpleColor
                      : ThemeColors.kFontGreyColor,
                ),
                SizedBox(height: 0.004.sh),
                Text(
                  navItems[index]['label'] as String,
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 16.sp,
                    fontWeight:
                    isSelected ? FontWeight.w700 : FontWeight.w500,
                    color: isSelected
                        ? ThemeColors.kFontPurpleColor
                        : ThemeColors.kFontGreyColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}