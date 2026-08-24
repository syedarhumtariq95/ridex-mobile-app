import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:ridex_mobile_app/src/configs/app/fonts_configs.dart';
import 'package:ridex_mobile_app/src/configs/button/driver_custom_button.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';
import 'package:ridex_mobile_app/src/configs/router/screen_navigation_service.dart';
import 'package:ridex_mobile_app/src/configs/theme/theme_colors.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/documentUpload/widgets/document_upload_tile_widget.dart';

import '../../../../../resources/driverDetail/driver_detail_repository.dart';

class DocumentsUploadScreen extends StatefulWidget {
  const DocumentsUploadScreen({super.key});

  @override
  State<DocumentsUploadScreen> createState() => _DocumentsUploadScreenState();
}

class _DocumentsUploadScreenState extends State<DocumentsUploadScreen> {
  final ImagePicker _picker = ImagePicker();
  bool _isSubmitting = false;

  // Title to Database Column mapping
  final Map<String, String> documentKeys = {
    'CNIC Front': 'cnic_front_url',
    'CNIC Back': 'cnic_back_url',
    'Driving License': 'license_url',
    'Vehicle Photo': 'vehicle_photo_url',
  };

  // Upload state check
  final Map<String, bool> uploadStatus = {
    'CNIC Front': false,
    'CNIC Back': false,
    'Driving License': false,
    'Vehicle Photo': false,
  };

  // Saved Public URLs
  final Map<String, String> uploadedUrls = {};

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  Future<void> _pickAndUploadImage(String title) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70, // Compression for fast upload
    );

    if (pickedFile == null) return;

    final userId = DI.i<SupabaseClient>().auth.currentUser?.id;
    if (userId == null) {
      _showSnackBar("User session expired. Please log in again.", isError: true);
      return;
    }

    try {
      _showSnackBar("Uploading $title...");

      final dbColumn = documentKeys[title]!;
      final publicUrl = await DI.i<DriverRepository>().uploadDocument(
        imageFile: File(pickedFile.path),
        driverId: userId,
        docType: dbColumn,
      );

      setState(() {
        uploadedUrls[dbColumn] = publicUrl;
        uploadStatus[title] = true;
      });

      _showSnackBar("$title uploaded successfully!");
    } catch (e) {
      _showSnackBar("Failed to upload $title: $e", isError: true);
    }
  }

  Future<void> _submitAllDocuments() async {
    if (uploadedUrls.length < documentKeys.length) {
      _showSnackBar("Please upload all 4 documents before submitting.", isError: true);
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      final userId = DI.i<SupabaseClient>().auth.currentUser?.id;
      if (userId == null) {
        _showSnackBar("User session expired.", isError: true);
        return;
      }

      await DI.i<DriverRepository>().updateDriverDocuments(
        driverId: userId,
        documentUrls: uploadedUrls,
      );

      ScreenNavigationService.navigationPush(
        CustomRouter.pendingVerificationScreenRouteName,
        replacement: true,
      );
    } catch (e) {
      _showSnackBar("Submission failed: $e", isError: true);
    } finally {
      setState(() => _isSubmitting = false);
    }
  }

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
                        onUploadTap: () => _pickAndUploadImage(title),
                      );
                    }).toList(),
                  ),
                ),
              ),

              /// Submit Button
              Center(
                child: _isSubmitting
                    ? const CircularProgressIndicator(
                  color: ThemeColors.kFontPurpleColor,
                )
                    : DriverCustomButton(
                  text: 'Submit',
                  onPressed: _submitAllDocuments,
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