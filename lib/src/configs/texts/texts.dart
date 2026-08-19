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
  static String get continueasguest =>
      _locale?.continueasguest ?? "continueasguest";
  static String get affordable => _locale?.affordable ?? "affordable";
  static String get prices => _locale?.prices ?? "prices";
  static String get bookride => _locale?.bookride ?? "bookride";
  static String get next => _locale?.next ?? "next";
  static String get getpickup => _locale?.getpickup ?? "getpickup";
  static String get fastpickup => _locale?.fastpickup ?? "fastpickup";
  static String get travelsafely => _locale?.travelsafely ?? "travelsafely";
  static String get safejourney => _locale?.safejourney ?? "safejourney";
  static String get finish => _locale?.finish ?? "finish";
  static String get createaccount => _locale?.createaccount ?? "createaccount";
  static String get signuptogetstarted =>
      _locale?.signuptogetstarted ?? "signuptogetstarted";
  static String get enteryourfirstname =>
      _locale?.enteryourfirstname ?? "enteryourfirstname";
  static String get firstname => _locale?.firstname ?? "firstname";

  static String get enteryourlastname =>
      _locale?.enteryourlastname ?? "enteryourlastname";
  static String get lastname => _locale?.lastname ?? "lastname";
  static String get email => _locale?.email ?? "email";
  static String get enteremail => _locale?.enteremail ?? "enteremail";
  static String get password => _locale?.password ?? "password";
  static String get confirmpassword =>
      _locale?.confirmpassword ?? "confirmpassword";
  static String get hint => _locale?.hint ?? "hint";
  static String get already => _locale?.already ?? "already";
  static String get login => _locale?.login ?? "login";
  static String get welcome => _locale?.welcome ?? "welcome";
  static String get logintocontinue =>
      _locale?.logintocontinue ?? "logintocontinue";
  static String get emailaddress => _locale?.emailaddress ?? "emailaddress";
  static String get forgotpassword =>
      _locale?.forgotpassword ?? "forgotpassword";
  static String get donthave => _locale?.donthave ?? "donthave";
  static String get signup => _locale?.signup ?? "signup";
  static String get whereto => _locale?.whereto ?? "whereto";
  static String get home => _locale?.home ?? "home";
  static String get lahore => _locale?.lahore ?? "lahore";
  static String get work => _locale?.work ?? "work";
  static String get software => _locale?.software ?? "software";
  static String get recent => _locale?.recent ?? "recent";
  static String get mall => _locale?.mall ?? "mall";
  static String get emporium => _locale?.emporium ?? "emporium";
  static String get pickup => _locale?.pickup ?? "pickup";
  static String get gulberg => _locale?.gulberg ?? "gulberg";
  static String get drop => _locale?.drop ?? "drop";
  static String get confirmlocation =>
      _locale?.confirmlocation ?? "confirmlocation";
  static String get choosearide => _locale?.choosearide ?? "choosearide";
  static String get confirmride => _locale?.confirmride ?? "confirmride";
  static String get findingyouadriver =>
      _locale?.findingyouadriver ?? "findingyouadriver";
  static String get thismaytakeafewseconds =>
      _locale?.thismaytakeafewseconds ?? "thismaytakeafewseconds";
  static String get cancelride => _locale?.cancelride ?? "cancelride";
  static String get fullname => _locale?.fullname ?? "fullname";
  static String get enterfullname => _locale?.enterfullname ?? "enterfullname";
  static String get phonenumber => _locale?.phonenumber ?? "phonenumber";
  static String get enterphonenumber => _locale?.enterphonenumber ?? "enterphonenumber";
}
