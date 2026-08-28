import 'package:flutter/material.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/authentication/driver_login_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/authentication/driver_signup_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/documentUpload/documents_upload_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/driver_dashboard_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDetail/driver_detail_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/navigationScreen/navigation_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/newRideRequest/new_ride_request_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/pendingVerification/pending_verification_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/tripCompleted/trip_completed_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/signup_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/findingDriver/finding_driver_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/home/home_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/liveTracking/live_tracking_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/myRideScreen/my_rides_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideCompleted/ride_completed_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/rideOption/ride_option_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/selectLocation/select_location_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/selectRole/choose_account_type_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/splash/onboarding_screen.dart';

import '../../ui/presentation/screens/Driver/screens/rideDetails/ride_detail_screen.dart';
import '../../ui/presentation/screens/authentication/login_screen.dart';
import '../../ui/presentation/screens/splash/splash_screen.dart';

/// A class for managing the application's routes.
class CustomRouter {
  CustomRouter._();

  static const String splashScreenRouteName = '/';
  static const String onboardingScreenRouteName = 'onboardingScreen';
  static const String signUpScreenRouteName = 'signupScreen';
  static const String loginScreenRouteName = 'loginScreen';
  static const String homeScreenRouteName = 'homeScreen';
  static const String selectLocationScreenRouteName = 'selectLocationScreen';
  static const String rideOptionScreenRouteName = 'rideOptionScreen';
  static const String findingDriverScreenRouteName = 'findingDriverScreen';
  static const String liveTrackingScreenRouteName = 'liveTrackingScreen';
  static const String rideCompletedScreenRouteName = 'rideCompletedScreen';
  static const String myRidesScreenRouteName = 'myRidesScreen';
  static const String chooseAccountTypeScreenRouteName =
      'chooseAccountTypeScreen';
  static const String driverLoginScreenRouteName = 'driverLoginScreen';
  static const String driverSignupScreenRouteName = 'driverSignupScreen';
  static const String driverDetailScreenRouteName = 'driverDetailScreen';
  static const String documentUploadScreenRouteName = 'documentUploadScreen';
  static const String pendingVerificationScreenRouteName =
      'pendingVerificationScreen';
  static const String driverDashboardScreenRouteName = 'driverDashboardScreen';
  static const String newRideRequestScreenRouteName = 'newRideRequestScreen';
  static const String rideDetailsScreenRouteName = 'rideDetailsScreen';
  static const String navigationScreenRouteName = 'navigationScreen';
  static const String tripCompletedScreenRouteName = 'tripCompletedScreen';

  /// Helper to return widget corresponding to settings (For RouteSettings navigation)
  static Widget buildWidget(String? name, Object? arguments) {
    switch (name) {
      case splashScreenRouteName:
        return SplashScreen();
      case onboardingScreenRouteName:
        return OnboardingScreen();
      case signUpScreenRouteName:
        return SignupScreen();
      case loginScreenRouteName:
        return LoginScreen();
      case homeScreenRouteName:
        return HomeScreen();
      case selectLocationScreenRouteName:
        return SelectLocationScreen();
      case rideOptionScreenRouteName:
        return RideOptionScreen();
      case findingDriverScreenRouteName:
        return FindingDriverScreen();
      case liveTrackingScreenRouteName:
        return LiveTrackingScreen();
      case rideCompletedScreenRouteName:
        return RideCompletedScreen();
      case myRidesScreenRouteName:
        return MyRidesScreen();
      case chooseAccountTypeScreenRouteName:
        return ChooseAccountTypeScreen();
      case driverLoginScreenRouteName:
        return DriverLoginScreen();
      case driverSignupScreenRouteName:
        return DriverSignupScreen();
      case driverDetailScreenRouteName:
        return DriverDetailsScreen();
      case documentUploadScreenRouteName:
        return DocumentsUploadScreen();
      case pendingVerificationScreenRouteName:
        return PendingVerificationScreen();
      case driverDashboardScreenRouteName:
        return DriverDashboardScreen();
      case newRideRequestScreenRouteName:
        final rideData = arguments as Map<String, dynamic>?;
        return NewRideRequestScreen(rideData: rideData);
      case rideDetailsScreenRouteName:
        final rideData = arguments as Map<String, dynamic>?;
        return RideDetailsScreen(rideData: rideData);
      case navigationScreenRouteName:
        final rideData = arguments as Map<String, dynamic>?;
        return NavigationScreen(rideData: rideData);
      case tripCompletedScreenRouteName:
        final rideData = arguments as Map<String, dynamic>?;
        return TripCompletedScreen(rideData: rideData);

      default:
        return const Scaffold(body: Center(child: Text('Route Not Found')));
    }
  }

  /// Map of available route names (Extracting arguments safely for MaterialApp routes)
  static final Map<String, Widget Function(BuildContext)> routes = {
    splashScreenRouteName: (context) => SplashScreen(),
    onboardingScreenRouteName: (context) => OnboardingScreen(),
    signUpScreenRouteName: (context) => SignupScreen(),
    loginScreenRouteName: (context) => LoginScreen(),
    homeScreenRouteName: (context) => HomeScreen(),
    selectLocationScreenRouteName: (context) => SelectLocationScreen(),
    rideOptionScreenRouteName: (context) => RideOptionScreen(),
    findingDriverScreenRouteName: (context) => FindingDriverScreen(),
    liveTrackingScreenRouteName: (context) => LiveTrackingScreen(),
    rideCompletedScreenRouteName: (context) => RideCompletedScreen(),
    myRidesScreenRouteName: (context) => MyRidesScreen(),
    chooseAccountTypeScreenRouteName: (context) => ChooseAccountTypeScreen(),
    driverLoginScreenRouteName: (context) => DriverLoginScreen(),
    driverSignupScreenRouteName: (context) => DriverSignupScreen(),
    driverDetailScreenRouteName: (context) => DriverDetailsScreen(),
    documentUploadScreenRouteName: (context) => DocumentsUploadScreen(),
    pendingVerificationScreenRouteName: (context) =>
        PendingVerificationScreen(),
    driverDashboardScreenRouteName: (context) => DriverDashboardScreen(),
    newRideRequestScreenRouteName: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      return NewRideRequestScreen(rideData: args);
    },
    rideDetailsScreenRouteName: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      return RideDetailsScreen(rideData: args);
    },
    navigationScreenRouteName: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      return NavigationScreen(rideData: args);
    },
    tripCompletedScreenRouteName: (context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      return TripCompletedScreen(rideData: args);
    },
  };
}