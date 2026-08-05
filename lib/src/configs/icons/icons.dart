import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons extends StatelessWidget {
  const CustomIcons({
    super.key,
    required this.iconPath,
    this.size,
    this.color,
    this.semanticLabel,
    this.onTap,
  });

  final String iconPath;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final iconWidget = SvgPicture.asset(
      iconPath,
      width: size,
      height: size,
      semanticsLabel: semanticLabel,


      colorFilter: color != null
          ? ColorFilter.mode(
        color!,
        BlendMode.srcIn,
      )
          : null,
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        child: iconWidget,
      );
    }

    return iconWidget;
  }
}

class CustomIconsPath {
  CustomIconsPath._();

  static const String folderAssets = 'assets';
  static const String folderIcons = 'icons';

  static const String calendar = 'calendar.svg';
  static const String car = 'car.svg';
  static const String rental = 'rental.svg';
  static const String fast = 'fast.svg';
  static const String safe = 'safe.svg';
  static const String profile = 'profile.svg';
  static const String email = 'email.svg';
  static const String lock = 'lock.svg';

  static String get calendarPath =>
      '$folderAssets/$folderIcons/$calendar';

  static String get carPath =>
      '$folderAssets/$folderIcons/$car';

  static String get rentalPath =>
      '$folderAssets/$folderIcons/$rental';

  static String get fastPath =>
      '$folderAssets/$folderIcons/$fast';

  static String get safePath =>
      '$folderAssets/$folderIcons/$safe';

  static String get profilePath =>
      '$folderAssets/$folderIcons/$profile';

  static String get emailPath =>
      '$folderAssets/$folderIcons/$email';

  static String get lockPath =>
      '$folderAssets/$folderIcons/$lock';
}