import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

class DocumentUploadTileWidget extends StatelessWidget {
  final String title;
  final bool isUploaded;
  final VoidCallback onUploadTap;

  const DocumentUploadTileWidget({
    super.key,
    required this.title,
    required this.onUploadTap,
    this.isUploaded = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.026.sh),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontFamily: FontsConfigs.poppinsFonts,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ThemeColors.kFontBlackColor,
                ),
              ),
              GestureDetector(
                onTap: onUploadTap,
                child: Container(
                  padding: EdgeInsets.all(0.02.sw),
                  decoration: BoxDecoration(
                    color: isUploaded
                        ? ThemeColors.kFontPurpleColor.withOpacity(0.1)
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: isUploaded
                          ? ThemeColors.kFontPurpleColor
                          : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Icon(
                    isUploaded
                        ? Icons.check_circle_outline_rounded
                        : Icons.file_upload_outlined,
                    size: 20.sp,
                    color: isUploaded
                        ? ThemeColors.kFontPurpleColor
                        : ThemeColors.kFontBlackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey.shade200,
          thickness: 1,
          height: 0.01.sh,
        ),
      ],
    );
  }
}