import '../../../l10n/app_localizations.dart';
import '../dependency_injection/dependency_injection.dart';
import '../dependency_injection/navigation_service.dart';

class CustomTexts {

  static AppLocalizations? get _locale {
    final context = DI.i<NavigationService>().getContext();

    if (context == null) {
      return null;
    }

    return AppLocalizations.of(context);
  }

  /// Splash Screen
  static String get ride => _locale?.ride ?? "Ride";

  static String get x => _locale?.x ?? "X";
  static String get yourride => _locale?.yourride ?? "yourride";
  static String get getstarted => _locale?.getstarted ?? "getstarted";
  static String get continueasguest => _locale?.continueasguest ?? "continueasguest";
}