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
  static const String menu = 'menu.svg';
  static const String search = 'search.svg';
  static const String location = 'location.svg';
  static const String work = 'work.svg';
  static const String mall = 'mall.svg';
  static const String phone = 'phone.svg';

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

  static String get menuPath =>
      '$folderAssets/$folderIcons/$menu';

  static String get searchPath =>
      '$folderAssets/$folderIcons/$search';

  static String get locationPath =>
      '$folderAssets/$folderIcons/$location';

  static String get workPath =>
      '$folderAssets/$folderIcons/$work';

  static String get mallPath =>
      '$folderAssets/$folderIcons/$mall';

  static String get phonePath =>
      '$folderAssets/$folderIcons/$phone';
}