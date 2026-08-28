import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import '../../../../../../configs/images/images.dart';
import '../../../../../../configs/router/routes.dart';
import '../../../../../../configs/router/screen_navigation_service.dart';
import 'widgets/navigation_bottom_bar_widget.dart';
import 'widgets/navigation_instruction_card_widget.dart';
import 'widgets/navigation_top_header_widget.dart';

class NavigationScreen extends StatelessWidget {
  final Map<String, dynamic>? rideData;

  const NavigationScreen({super.key, this.rideData});

  Future<void> _completeTrip(BuildContext context, String rideId) async {
    print("=== DEBUG: Complete Trip Triggered ===");
    print("Ride ID: '$rideId'");

    try {
      if (rideId.isNotEmpty) {
        // .select() lagane se pata chalega ke row update hui ya 0 rows affect huin
        final response = await DI
            .i<SupabaseClient>()
            .from('rides')
            .update({'status': 'completed'})
            .eq('id', rideId)
            .select();

        print("=== DEBUG: Supabase Response ===");
        print(response);

        if (response.isEmpty) {
          print("⚠️ WARNING: Query run hui lekin koi row update nahi hui! (Check RLS Policy / ID mismatch)");
        } else {
          print("✅ SUCCESS: Status successfully changed to completed!");
        }
      } else {
        print("❌ ERROR: rideId khali (empty) hai!");
      }

      if (context.mounted) {
        ScreenNavigationService.navigationPush(
          CustomRouter.tripCompletedScreenRouteName,
          arguments: rideData,
          replacement: true,
        );
      }
    } catch (e, stackTrace) {
      print("❌ SUPABASE UPDATE ERROR: $e");
      print("STACKTRACE: $stackTrace");

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error completing trip: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final rideId = rideData?['id']?.toString() ?? '';
    final dropoff = rideData?['dropoff_address'] ?? 'Dropoff Location';
    final distance = rideData?['distance'] ?? '4.2 km';

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              CustomImagesPath.maplocationImagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavigationTopHeaderWidget(
              title: 'Head to Dropoff',
              location: dropoff,
            ),
          ),
          Positioned(
            left: 0.05.sw,
            right: 0.05.sw,
            bottom: 0.03.sh,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const NavigationInstructionCardWidget(
                  distance: '850 m',
                  instruction: 'Turn right',
                ),
                SizedBox(height: 0.015.sh),
                NavigationBottomBarWidget(
                  time: '12 min',
                  distance: distance,
                  onNavigateTap: () => _completeTrip(context, rideId),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}