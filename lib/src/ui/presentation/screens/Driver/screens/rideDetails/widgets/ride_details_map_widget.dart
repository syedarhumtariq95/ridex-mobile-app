import 'package:flutter/material.dart';
import '../../../../../../../configs/images/images.dart';

class RideDetailsMapWidget extends StatelessWidget {
  const RideDetailsMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(
        CustomImagesPath.maplocationImagePath,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}