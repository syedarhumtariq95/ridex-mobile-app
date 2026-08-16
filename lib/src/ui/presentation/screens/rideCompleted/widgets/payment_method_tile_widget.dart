import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class PaymentMethodTileWidget extends StatelessWidget {
  final String paymentMethod;

  PaymentMethodTileWidget({super.key, this.paymentMethod = 'Cash'});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 0.04.sw, vertical: 0.015.sh),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(0.015.sw),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 18.sp,
              color: ThemeColors.kFontBlackColor,
            ),
          ),
          SizedBox(width: 0.03.sw),
          Expanded(
            child: Text(
              paymentMethod,
              style: TextStyle(
                fontFamily: FontsConfigs.poppinsFonts,
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ThemeColors.kFontBlackColor,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ThemeColors.kFontGreyColor,
            size: 22.sp,
          ),
        ],
      ),
    );
  }
}
