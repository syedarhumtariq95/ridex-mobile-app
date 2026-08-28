import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import '../../../../../../configs/button/driver_custom_button.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';
import 'widgets/ride_details_card_widget.dart';
import 'widgets/ride_details_map_widget.dart';

class RideDetailsScreen extends StatelessWidget {
  final Map<String, dynamic>? rideData;

  const RideDetailsScreen({super.key, this.rideData});

  Future<void> _startRide(BuildContext context, String rideId) async {
    try {
      if (rideId.isNotEmpty) {
        await DI.i<SupabaseClient>().from('rides').update({
          'status': 'ongoing',
        }).eq('id', rideId);
      }

      ScreenNavigationService.navigationPush(
        CustomRouter.navigationScreenRouteName,
        arguments: rideData,
        replacement: true,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error starting ride: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final rideId = rideData?['id'] ?? '';
    final pickup = rideData?['pickup_address'] ?? 'Gulberg 3, Lahore';
    final drop = rideData?['dropoff_address'] ?? 'Packages Mall';
    final distance = rideData?['distance'] ?? '12.4 km';
    final fare = rideData?['fare']?.toString() ?? '450';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                const Positioned.fill(child: RideDetailsMapWidget()),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: RideDetailsCardWidget(
                    pickupLocation: pickup,
                    dropLocation: drop,
                    distance: distance,
                    fare: fare,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(
              horizontal: 0.05.sw,
              vertical: 0.018.sh,
            ),
            child: DriverCustomButton(
              text: 'Start Ride',
              onPressed: () => _startRide(context, rideId),
            ),
          ),
          SizedBox(height: 0.06.sh),
        ],
      ),
    );
  }
}