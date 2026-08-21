class RideXUser {
  final String id;
  final String email;
  final String fullName;
  final String phone;
  final String role;

  RideXUser({
    required this.id,
    required this.email,
    required this.fullName,
    required this.phone,
    required this.role,
  });

  /// Factory constructor to parse JSON from Supabase / SQFLite
  factory RideXUser.fromJson(Map<String, dynamic> json) {
    return RideXUser(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullName: json['full_name'] ?? json['fullName'] ?? '',
      phone: json['phone'] ?? '',
      role: json['role'] ?? 'customer',
    );
  }

  /// Convert object to JSON for SQFLite Local Storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'phone': phone,
      'role': role,
    };
  }

  /// CopyWith helper function to easily modify user properties
  RideXUser copyWith({
    String? id,
    String? email,
    String? fullName,
    String? phone,
    String? role,
  }) {
    return RideXUser(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }
}