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

      // Agar color diya gaya hai to wahi lagega,
      // warna SVG ka original color use hoga.
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

  static String get calendarPath =>
      '$folderAssets/$folderIcons/$calendar';

  static String get carPath =>
      '$folderAssets/$folderIcons/$car';
}