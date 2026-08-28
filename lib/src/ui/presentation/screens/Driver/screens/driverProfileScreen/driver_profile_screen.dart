import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import '../../../../../../configs/images/images.dart';
import 'widgets/profile_header_widget.dart';
import 'widgets/profile_menu_item_widget.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  /// Handles Supabase auth logout and clears navigation stack
  Future<void> _handleLogout(BuildContext context) async {
    try {
      // 1. Sign out from Supabase Auth Session
      await DI.i<SupabaseClient>().auth.signOut();

      if (!context.mounted) return;

      // 2. Clear entire navigation stack and navigate to ChooseAccountTypeScreen
      Navigator.of(context).pushNamedAndRemoveUntil(
        CustomRouter.chooseAccountTypeScreenRouteName,
            (route) => false,
      );
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout Failed: $e')),
        );
      }
    }
  }

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
        'onTap': () => _handleLogout(context),
      },
    ];

    return Column(
      children: [
        /// Top Purple Header Extendable Section
        ProfileHeaderWidget(
          driverName: 'Ali Raza',
          imagePath: CustomImagesPath.alirazaImagePath,
          onViewProfileTap: () {},
        ),

        /// Scrollable Menu Items List
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