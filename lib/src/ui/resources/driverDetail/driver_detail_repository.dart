
import 'dart:io';

import '../../models/driverDetail/driver_detail_model.dart';
import 'driver_detail_provider.dart';

class DriverRepository {
  final DriverProvider _provider;

  DriverRepository(this._provider);

  /// 1. Basic Details Submit karna
  Future<void> submitDriverDetails(DriverDetailModel details) async {
    await _provider.submitDriverDetails(details);
  }

  /// 2. Image
  Future<String> uploadDocument({
    required File imageFile,
    required String driverId,
    required String docType,
  }) async {
    return await _provider.uploadDocument(
      imageFile: imageFile,
      driverId: driverId,
      docType: docType,
    );
  }

  /// 3. Uploaded URLs
  Future<void> updateDriverDocuments({
    required String driverId,
    required Map<String, String> documentUrls,
  }) async {
    await _provider.updateDriverDocuments(
      driverId: driverId,
      documentUrls: documentUrls,
    );
  }

  ///
  Future<void> updateOnlineStatus(String driverId, bool isOnline) async {
    await _provider.updateOnlineStatus(driverId, isOnline);
  }

  Future<bool> checkDriverApprovalStatus(String driverId) async {
    return await _provider.checkDriverApprovalStatus(driverId);
  }
}