class DriverDetailModel {
  final String? id;
  final String driverId;
  final String vehicleType;
  final String vehicleModel;
  final String vehicleNumber;
  final String? licenseNumber;
  final String? cnicFrontUrl;
  final String? cnicBackUrl;
  final String? licenseUrl;
  final String? vehiclePhotoUrl;
  final bool isApproved;

  DriverDetailModel({
    this.id,
    required this.driverId,
    required this.vehicleType,
    required this.vehicleModel,
    required this.vehicleNumber,
    this.licenseNumber,
    this.cnicFrontUrl,
    this.cnicBackUrl,
    this.licenseUrl,
    this.vehiclePhotoUrl,
    this.isApproved = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'driver_id': driverId,
      'vehicle_type': vehicleType,
      'vehicle_model': vehicleModel,
      'vehicle_number': vehicleNumber,
      'license_number': licenseNumber ?? '',
      'cnic_front_url': cnicFrontUrl ?? '',
      'cnic_back_url': cnicBackUrl ?? '',
      'license_url': licenseUrl ?? '',
      'vehicle_photo_url': vehiclePhotoUrl ?? '',
      'is_approved': isApproved,
    };
  }

  factory DriverDetailModel.fromJson(Map<String, dynamic> json) {
    return DriverDetailModel(
      id: json['id'] as String?,
      driverId: json['driver_id'] as String,
      vehicleType: json['vehicle_type'] as String,
      vehicleModel: json['vehicle_model'] as String,
      vehicleNumber: json['vehicle_number'] as String,
      licenseNumber: json['license_number'] as String?,
      cnicFrontUrl: json['cnic_front_url'] as String?,
      cnicBackUrl: json['cnic_back_url'] as String?,
      licenseUrl: json['license_url'] as String?,
      vehiclePhotoUrl: json['vehicle_photo_url'] as String?,
      isApproved: json['is_approved'] as bool? ?? false,
    );
  }
}