class RideModel {
  final String id;
  final String riderId;
  final String? driverId;
  final String pickupAddress;
  final String dropoffAddress;
  final double fare;
  final String distance;
  final String status;

  RideModel({
    required this.id,
    required this.riderId,
    this.driverId,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.fare,
    required this.distance,
    required this.status,
  });

  factory RideModel.fromJson(Map<String, dynamic> json) {
    return RideModel(
      id: json['id'] ?? '',
      riderId: json['rider_id'] ?? '',
      driverId: json['driver_id'],
      pickupAddress: json['pickup_address'] ?? 'Unknown Location',
      dropoffAddress: json['dropoff_address'] ?? 'Unknown Destination',
      fare: (json['fare'] as num?)?.toDouble() ?? 0.0,
      distance: json['distance'] ?? '0 km',
      status: json['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rider_id': riderId,
      'driver_id': driverId,
      'pickup_address': pickupAddress,
      'dropoff_address': dropoffAddress,
      'fare': fare,
      'distance': distance,
      'status': status,
    };
  }
}