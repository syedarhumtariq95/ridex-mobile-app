import 'package:flutter/material.dart';
import 'package:ridex_mobile_app/src/ui/presentation/screens/authentication/signup_screen.dart';
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
  };
}
