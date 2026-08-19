import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/images/images.dart';
import '../Driver/screens/driverProfileScreen/widgets/profile_menu_item_widget.dart';
import 'widgets/user_profile_header_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Personal Info',
        'icon': Icons.person_outline_rounded,
        'onTap': () {},
      },
      {
        'title': 'Payment Methods',
        'icon': Icons.credit_card_outlined,
        'onTap': () {},
      },
      {
        'title': 'My Rides',
        'icon': Icons.directions_car_outlined,
        'onTap': () {},
      },
      {
        'title': 'Saved Places',
        'icon': Icons.bookmark_outline_rounded,
        'onTap': () {},
      },
      {
        'title': 'Promo Codes',
        'icon': Icons.local_offer_outlined,
        'onTap': () {},
      },
      {
        'title': 'Support',
        'icon': Icons.headset_mic_outlined,
        'onTap': () {},
      },
      {
        'title': 'Settings',
        'icon': Icons.settings_outlined,
        'onTap': () {},
      },
      {
        'title': 'Log Out',
        'icon': Icons.logout_rounded,
        'onTap': () {},
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /// Top Green Header with Back Button (Full Screen Status Bar)
          UserProfileHeaderWidget(
            userName: 'Hamza Ali',
            imagePath: CustomImagesPath.alirazaImagePath,
            onBackTap: () => Navigator.pop(context),
            onViewProfileTap: () {},
          ),

          /// Menu Options List
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 0.05.sw,
                vertical: 0.015.sh,
              ),
              physics: const BouncingScrollPhysics(),
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
      ),
    );
  }
}