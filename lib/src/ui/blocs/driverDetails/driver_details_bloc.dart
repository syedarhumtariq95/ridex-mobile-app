import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../models/driverDetail/driver_detail_model.dart';
import '../../resources/driverDetail/driver_detail_repository.dart';


part 'driver_details_event.dart';
part 'driver_details_state.dart';

class DriverDetailsBloc extends Bloc<DriverDetailsEvent, DriverDetailsState> {
  final DriverRepository _repository;
  final SupabaseClient _supabaseClient;

  DriverDetailsBloc(this._repository, this._supabaseClient)
      : super(DriverDetailsInitial()) {
    on<SubmitDriverDetailsEvent>(_onSubmitDriverDetails);
  }

  Future<void> _onSubmitDriverDetails(
      SubmitDriverDetailsEvent event,
      Emitter<DriverDetailsState> emit,
      ) async {
    emit(DriverDetailsLoading());
    try {
      final currentUserId = _supabaseClient.auth.currentUser?.id;
      if (currentUserId == null) {
        emit(DriverDetailsFailure("User session expire"));
        return;
      }

      final driverDetail = DriverDetailModel(
        driverId: currentUserId,
        vehicleType: event.vehicleType,
        vehicleModel: event.vehicleModel,
        vehicleNumber: event.vehicleNumber,
        licenseNumber: event.licenseNumber,
      );

      await _repository.submitDriverDetails(driverDetail);
      emit(DriverDetailsSuccess());
    } catch (e) {
      emit(DriverDetailsFailure(e.toString()));
    }
  }
}