part of 'driver_details_bloc.dart';

abstract class DriverDetailsEvent {}

class SubmitDriverDetailsEvent extends DriverDetailsEvent {
  final String vehicleType;
  final String vehicleModel;
  final String vehicleNumber;
  final String licenseNumber;

  SubmitDriverDetailsEvent({
    required this.vehicleType,
    required this.vehicleModel,
    required this.vehicleNumber,
    required this.licenseNumber,
  });
}