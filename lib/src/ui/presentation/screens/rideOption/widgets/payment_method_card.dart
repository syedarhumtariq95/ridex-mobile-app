import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class PaymentMethodCard extends StatelessWidget {
  PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 0.04.sw,
        vertical: 0.022.sh,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(0.018.sw),

                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 24.sp,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
              SizedBox(width: 0.03.sw),
              Text(
                'Cash',
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
            ],
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 24.sp,
            color: ThemeColors.kFontBlackColor,
          ),
        ],
      ),
    );
  }
}