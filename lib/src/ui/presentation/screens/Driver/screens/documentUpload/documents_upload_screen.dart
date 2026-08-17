import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/documentUpload/widgets/document_upload_tile_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/custom_button.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';

import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';

class DocumentsUploadScreen extends StatefulWidget {
  const DocumentsUploadScreen({super.key});

  @override
  State<DocumentsUploadScreen> createState() => _DocumentsUploadScreenState();
}

class _DocumentsUploadScreenState extends State<DocumentsUploadScreen> {
  Map<String, bool> uploadStatus = {
    'CNIC Front': false,
    'CNIC Back': false,
    'Driving License': false,
    'Vehicle Photo': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.06.sw,
            vertical: 0.03.sh,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 0.01.sh),

              /// Header Title
              Center(
                child: Text(
                  'Documents Upload',
                  style: TextStyle(
                    fontFamily: FontsConfigs.poppinsFonts,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: ThemeColors.kFontBlackColor,
                  ),
                ),
              ),

              SizedBox(height: 0.04.sh),

              /// Document List
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: uploadStatus.keys.map((title) {
                      return DocumentUploadTileWidget(
                        title: title,
                        isUploaded: uploadStatus[title] ?? false,
                        onUploadTap: () {
                          setState(() {
                            uploadStatus[title] = !(uploadStatus[title] ?? false);
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),

              /// Submit Button
              Center(
                child: DriverCustomButton(
                  text: 'Submit',
                  onPressed: () {
                    ScreenNavigationService.navigationPush(
                      CustomRouter.pendingVerificationScreenRouteName,
                      replacement: false,
                    );
                  },
                ),
              ),

              SizedBox(height: 0.02.sh),
            ],
          ),
        ),
      ),
    );
  }
}