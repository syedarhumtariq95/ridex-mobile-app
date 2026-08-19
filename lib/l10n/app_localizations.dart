import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @ride.
  ///
  /// In en, this message translates to:
  /// **'Ride'**
  String get ride;

  /// No description provided for @x.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get x;

  /// No description provided for @yourride.
  ///
  /// In en, this message translates to:
  /// **'Your ride, your way'**
  String get yourride;

  /// No description provided for @getstarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getstarted;

  /// No description provided for @continueasguest.
  ///
  /// In en, this message translates to:
  /// **'Continue as Guest'**
  String get continueasguest;

  /// No description provided for @affordable.
  ///
  /// In en, this message translates to:
  /// **'Affordable Rides'**
  String get affordable;

  /// No description provided for @bookride.
  ///
  /// In en, this message translates to:
  /// **'Book rides at the best prices in your city'**
  String get bookride;

  /// No description provided for @prices.
  ///
  /// In en, this message translates to:
  /// **'Prices in your city'**
  String get prices;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'finish'**
  String get finish;

  /// No description provided for @fastpickup.
  ///
  /// In en, this message translates to:
  /// **'Fast Pickup'**
  String get fastpickup;

  /// No description provided for @getpickup.
  ///
  /// In en, this message translates to:
  /// **'Get picked up quickly anywhere.'**
  String get getpickup;

  /// No description provided for @safejourney.
  ///
  /// In en, this message translates to:
  /// **'Safe Journey'**
  String get safejourney;

  /// No description provided for @travelsafely.
  ///
  /// In en, this message translates to:
  /// **'Travel safely with trusted drivers.'**
  String get travelsafely;

  /// No description provided for @createaccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createaccount;

  /// No description provided for @signuptogetstarted.
  ///
  /// In en, this message translates to:
  /// **'Sign Up to get started'**
  String get signuptogetstarted;

  /// No description provided for @firstname.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstname;

  /// No description provided for @enteryourfirstname.
  ///
  /// In en, this message translates to:
  /// **'Enter your first name'**
  String get enteryourfirstname;

  /// No description provided for @lastname.
  ///
  /// In en, this message translates to:
  /// **'last Name'**
  String get lastname;

  /// No description provided for @enteryourlastname.
  ///
  /// In en, this message translates to:
  /// **'Enter your last name'**
  String get enteryourlastname;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enteremail.
  ///
  /// In en, this message translates to:
  /// **'name@gmail.com'**
  String get enteremail;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @hint.
  ///
  /// In en, this message translates to:
  /// **'******'**
  String get hint;

  /// No description provided for @confirmpassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmpassword;

  /// No description provided for @already.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome!'**
  String get welcome;

  /// No description provided for @logintocontinue.
  ///
  /// In en, this message translates to:
  /// **'Login to continue'**
  String get logintocontinue;

  /// No description provided for @emailaddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get emailaddress;

  /// No description provided for @forgotpassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotpassword;

  /// No description provided for @donthave.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get donthave;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @whereto.
  ///
  /// In en, this message translates to:
  /// **'Where to?'**
  String get whereto;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @lahore.
  ///
  /// In en, this message translates to:
  /// **'123 Main Sport, Lahore'**
  String get lahore;

  /// No description provided for @work.
  ///
  /// In en, this message translates to:
  /// **'Work'**
  String get work;

  /// No description provided for @software.
  ///
  /// In en, this message translates to:
  /// **'Arfa Software Technology Park'**
  String get software;

  /// No description provided for @recent.
  ///
  /// In en, this message translates to:
  /// **'Recent Places'**
  String get recent;

  /// No description provided for @mall.
  ///
  /// In en, this message translates to:
  /// **'Packages Mall'**
  String get mall;

  /// No description provided for @emporium.
  ///
  /// In en, this message translates to:
  /// **'Emporium Mall'**
  String get emporium;

  /// No description provided for @pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup Location'**
  String get pickup;

  /// No description provided for @gulberg.
  ///
  /// In en, this message translates to:
  /// **'Gulberg 3, Lahore'**
  String get gulberg;

  /// No description provided for @drop.
  ///
  /// In en, this message translates to:
  /// **'Drop Location'**
  String get drop;

  /// No description provided for @confirmlocation.
  ///
  /// In en, this message translates to:
  /// **'Confirm Location'**
  String get confirmlocation;

  /// No description provided for @choosearide.
  ///
  /// In en, this message translates to:
  /// **'Choose a ride'**
  String get choosearide;

  /// No description provided for @confirmride.
  ///
  /// In en, this message translates to:
  /// **'Confirm ride'**
  String get confirmride;

  /// No description provided for @findingyouadriver.
  ///
  /// In en, this message translates to:
  /// **'Finding you a driver'**
  String get findingyouadriver;

  /// No description provided for @thismaytakeafewseconds.
  ///
  /// In en, this message translates to:
  /// **'This may take a few seconds'**
  String get thismaytakeafewseconds;

  /// No description provided for @cancelride.
  ///
  /// In en, this message translates to:
  /// **'Cancel Ride'**
  String get cancelride;

  /// No description provided for @fullname.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullname;

  /// No description provided for @enterfullname.
  ///
  /// In en, this message translates to:
  /// **'Enter Full Name'**
  String get enterfullname;

  /// No description provided for @phonenumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phonenumber;

  /// No description provided for @enterphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterphonenumber;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
