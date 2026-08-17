import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';

class TotalEarningsBannerWidget extends StatelessWidget {
  final String amount;

  const TotalEarningsBannerWidget({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 0.035.sh,
        horizontal: 0.05.sw,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF5B39A8),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF5B39A8).withOpacity(0.25),
            blurRadius: 15,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'PKR $amount',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 32.sp,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 0.006.sh),
          Text(
            'Total Earnings',
            style: TextStyle(
              fontFamily: FontsConfigs.poppinsFonts,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }
}