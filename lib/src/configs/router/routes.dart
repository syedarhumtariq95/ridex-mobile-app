import 'package:flutter/material.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/authentication/driver_login_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/authentication/driver_signup_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/documentUpload/documents_upload_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDashboard/driver_dashboard_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/driverDetail/driver_detail_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/navigationScreen/navigation_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/newRideRequest/new_ride_request_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/pendingVerification/pending_verification_screen.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/Driver/screens/rideDetails/ride_detail_screen.dart';
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

import '../../ui/presentation/screens/authentication/login_screen.dart';
import '../../ui/presentation/screens/splash/splash_screen.dart';

/// A class for managing the application's routes.
///
/// This class defines the route names and their corresponding widgets,
/// allowing for centralized management of the navigation system.
class CustomRouter {
  /// Private constructor to prevent instantiation.
  CustomRouter._();

  // Feature: Onboarding routes
  /// Route name for the splash screen.
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
  static const String chooseAccountTypeScreenRouteName = 'chooseAccountTypeScreen';
  static const String driverLoginScreenRouteName = 'driverLoginScreen';
  static const String driverSignupScreenRouteName = 'driverSignupScreen';
  static const String driverDetailScreenRouteName = 'driverDetailScreen';
  static const String documentUploadScreenRouteName = 'documentUploadScreen';
  static const String pendingVerificationScreenRouteName = 'pendingVerificationScreen';
  static const String driverDashboardScreenRouteName = 'driverDashboardScreen';
  static const String newRideRequestScreenRouteName = 'newRideRequestScreen';
  static const String rideDetailsScreenRouteName = 'rideDetailsScreen';
  static const String navigationScreenRouteName = 'navigationScreen';
  static const String tripCompletedScreenRouteName = 'tripCompletedScreen';

  /// A map of route names to their corresponding widget builders.
  ///
  /// This map defines the routes and the widgets that should be displayed
  /// when navigating to those routes.
  static final Map<String, Widget Function(BuildContext)> routes = {
    // Route for the splash screen.
    splashScreenRouteName: (BuildContext context) => SplashScreen(),
    onboardingScreenRouteName: (BuildContext context) => OnboardingScreen(),
    signUpScreenRouteName: (BuildContext context) => SignupScreen(),
    loginScreenRouteName: (BuildContext context) => LoginScreen(),
    homeScreenRouteName: (BuildContext context) => HomeScreen(),
    selectLocationScreenRouteName: (BuildContext context) =>
        SelectLocationScreen(),
    rideOptionScreenRouteName: (BuildContext context) => RideOptionScreen(),
    findingDriverScreenRouteName: (BuildContext context) =>
        FindingDriverScreen(),
    liveTrackingScreenRouteName: (BuildContext context) => LiveTrackingScreen(),
    rideCompletedScreenRouteName: (BuildContext context) =>
        RideCompletedScreen(),
    myRidesScreenRouteName: (BuildContext context) => MyRidesScreen(),
    chooseAccountTypeScreenRouteName: (BuildContext context) => ChooseAccountTypeScreen(),
    driverLoginScreenRouteName: (BuildContext context) => DriverLoginScreen(),
    driverSignupScreenRouteName: (BuildContext context) => DriverSignupScreen(),
    driverDetailScreenRouteName: (BuildContext context) => DriverDetailsScreen(),
    documentUploadScreenRouteName: (BuildContext context) => DocumentsUploadScreen(),
    pendingVerificationScreenRouteName: (BuildContext context) => PendingVerificationScreen(),
    driverDashboardScreenRouteName: (BuildContext context) => DriverDashboardScreen(),
    newRideRequestScreenRouteName: (BuildContext context) => NewRideRequestScreen(),
    rideDetailsScreenRouteName: (BuildContext context) => RideDetailsScreen(),
    navigationScreenRouteName: (BuildContext context) => NavigationScreen(),
    tripCompletedScreenRouteName: (BuildContext context) => TripCompletedScreen(),
  };
}
