import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ridex_mobile_app/src/configs/dependency_injection/dependency_injection.dart';
import 'package:ridex_mobile_app/src/configs/router/routes.dart';

class NewRideRequestScreen extends StatefulWidget {
  final Map<String, dynamic>? rideData;

  const NewRideRequestScreen({super.key, this.rideData});

  @override
  State<NewRideRequestScreen> createState() => _NewRideRequestScreenState();
}

class _NewRideRequestScreenState extends State<NewRideRequestScreen> {
  bool isProcessing = false;

  /// Reject Ride Request
  Future<void> _rejectRide() async {
    final rideId = widget.rideData?['id'];
    if (rideId != null) {
      setState(() => isProcessing = true);
      try {
        await DI.i<SupabaseClient>()
            .from('rides')
            .update({'status': 'rejected'})
            .eq('id', rideId);
      } catch (e) {
        debugPrint("Error rejecting ride: $e");
      }
    }

    // Direct Flutter native pop logic to avoid black screen issue
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  /// Accept Ride Request
  Future<void> _acceptRide() async {
    final rideId = widget.rideData?['id'];
    final driverId = DI.i<SupabaseClient>().auth.currentUser?.id;

    if (rideId != null) {
      setState(() => isProcessing = true);
      try {
        await DI.i<SupabaseClient>().from('rides').update({
          'status': 'accepted',
          'driver_id': driverId,
        }).eq('id', rideId);

        if (mounted) {
          // Go to Ride Details / Navigation Screen
          Navigator.pushReplacementNamed(
            context,
            CustomRouter.rideDetailsScreenRouteName,
            arguments: widget.rideData,
          );
        }
      } catch (e) {
        if (mounted) {
          setState(() => isProcessing = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Failed to accept ride: $e")),
          );
        }
      }
    } else {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final String pickup = widget.rideData?['pickup_address'] ?? 'Pickup Location';
    final String dropoff = widget.rideData?['dropoff_address'] ?? 'Dropoff Location';
    final String fare = widget.rideData?['fare']?.toString() ?? '0';
    final String distance = widget.rideData?['distance'] ?? '1.2 km';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            /// Header Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.06.sw, vertical: 0.02.sh),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "New Ride Request",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "$distance away",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Map Placeholder Area
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.blue.shade50,
                child: Center(
                  child: Icon(
                    Icons.map_rounded,
                    size: 80.r,
                    color: Colors.blue.shade300,
                  ),
                ),
              ),
            ),

            /// Ride Details Container Card
            Container(
              padding: EdgeInsets.all(0.06.sw),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Pickup Location
                  Row(
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 16.r),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pickup",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              pickup,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  /// Dropoff Location
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.red, size: 16.r),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drop",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey,
                              ),
                            ),
                            Text(
                              dropoff,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  const Divider(),
                  SizedBox(height: 12.h),

                  /// Estimated Fare
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Estimated Fare",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Text(
                        "PKR $fare",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  /// Buttons: Reject / Accept
                  isProcessing
                      ? const CircularProgressIndicator()
                      : Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _rejectRide,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade200,
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            "Reject",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _acceptRide,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7A1DF1),
                            elevation: 0,
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          child: Text(
                            "Accept",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}