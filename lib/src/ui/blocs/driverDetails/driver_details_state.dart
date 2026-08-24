part of 'driver_details_bloc.dart';

abstract class DriverDetailsState {}

class DriverDetailsInitial extends DriverDetailsState {}

class DriverDetailsLoading extends DriverDetailsState {}

class DriverDetailsSuccess extends DriverDetailsState {}

class DriverDetailsFailure extends DriverDetailsState {
  final String errorMessage;

  DriverDetailsFailure(this.errorMessage);
}