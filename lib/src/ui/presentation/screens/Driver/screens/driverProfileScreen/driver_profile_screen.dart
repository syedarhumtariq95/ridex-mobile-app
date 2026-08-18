import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../configs/images/images.dart';
import 'widgets/profile_header_widget.dart';
import 'widgets/profile_menu_item_widget.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Vehicle Information',
        'icon': Icons.directions_car_outlined,
        'onTap': () {},
      },
      {
        'title': 'Documents',
        'icon': Icons.insert_drive_file_outlined,
        'onTap': () {},
      },
      {
        'title': 'Earnings',
        'icon': Icons.account_balance_wallet_outlined,
        'onTap': () {},
      },
      {
        'title': 'Payment Methods',
        'icon': Icons.credit_card_outlined,
        'onTap': () {},
      },
      {'title': 'Support', 'icon': Icons.headset_mic_outlined, 'onTap': () {}},
      {'title': 'Settings', 'icon': Icons.settings_outlined, 'onTap': () {}},
      {'title': 'Log Out', 'icon': Icons.logout_rounded, 'onTap': () {}},
    ];

    return Column(
      children: [
        /// Top Purple Header (Status bar tak extend hone wala header)
        ProfileHeaderWidget(
          driverName: 'Ali Raza',
          imagePath: CustomImagesPath.alirazaImagePath,
          onViewProfileTap: () {},
        ),

        /// Scrollable Menu List
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 0.05.sw,
              vertical: 0.015.sh,
            ),
            child: Column(
              children: menuItems.map((item) {
                return ProfileMenuItemWidget(
                  icon: item['icon'] as IconData,
                  title: item['title'] as String,
                  onTap: item['onTap'] as VoidCallback,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
