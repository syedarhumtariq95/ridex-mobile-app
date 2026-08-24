import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/driverDetail/driver_detail_model.dart';

class DriverProvider {
  final SupabaseClient _supabaseClient;

  DriverProvider(this._supabaseClient);

  /// 1. Driver Basic Details Save
  Future<void> submitDriverDetails(DriverDetailModel details) async {
    try {
      await _supabaseClient
          .from('driver_details')
          .upsert(details.toJson(), onConflict: 'driver_id');
    } catch (e) {
      throw Exception('Driver details save error: $e');
    }
  }

  /// 2. Image Supabase Storage Bucket
  Future<String> uploadDocument({
    required File imageFile,
    required String driverId,
    required String docType,
  }) async {
    try {
      final fileName = '${driverId}_${docType}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'documents/$fileName';

      // Bucket Image Uploading
      await _supabaseClient.storage
          .from('driver-documents')
          .upload(path, imageFile);

      // Upload
      final publicUrl = _supabaseClient.storage
          .from('driver-documents')
          .getPublicUrl(path);

      return publicUrl;
    } catch (e) {
      print("DEBUG_STORAGE_UPLOAD_ERROR: $e");
      rethrow;
    }
  }

  /// 3. Upload
  Future<void> updateDriverDocuments({
    required String driverId,
    required Map<String, String> documentUrls,
  }) async {
    try {
      await _supabaseClient
          .from('driver_details')
          .update(documentUrls)
          .eq('driver_id', driverId);
    } catch (e) {
      print("DEBUG_DB_UPDATE_ERROR: $e");
      rethrow;
    }
  }

  ///
  Future<void> updateOnlineStatus(String driverId, bool isOnline) async {
    try {
      await _supabaseClient
          .from('driver_details')
          .update({'is_online': isOnline})
          .eq('driver_id', driverId);
    } catch (e) {
      print("DEBUG_ONLINE_STATUS_ERROR: $e");
      rethrow;
    }
  }

  Future<bool> checkDriverApprovalStatus(String driverId) async {
    try {
      final response = await _supabaseClient
          .from('driver_details')
          .select('is_approved')
          .eq('driver_id', driverId)
          .maybeSingle();

      if (response != null) {
        return response['is_approved'] ?? false;
      }
      return false;
    } catch (e) {
      print("DEBUG_APPROVAL_CHECK_ERROR: $e");
      return false;
    }
  }
}