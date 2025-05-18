import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'helper_localizations_ar.dart';
import 'helper_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of HelperLocalizations
/// returned by `HelperLocalizations.of(context)`.
///
/// Applications need to include `HelperLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/helper_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HelperLocalizations.localizationsDelegates,
///   supportedLocales: HelperLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the HelperLocalizations.supportedLocales
/// property.
abstract class HelperLocalizations {
  HelperLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HelperLocalizations? of(BuildContext context) {
    return Localizations.of<HelperLocalizations>(context, HelperLocalizations);
  }

  static const LocalizationsDelegate<HelperLocalizations> delegate = _HelperLocalizationsDelegate();

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
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @cancel.
  ///
  /// In ar, this message translates to:
  /// **'إلغاء'**
  String get cancel;

  /// No description provided for @darkTheme.
  ///
  /// In ar, this message translates to:
  /// **'الوضع الداكن'**
  String get darkTheme;

  /// No description provided for @leave.
  ///
  /// In ar, this message translates to:
  /// **'مغادرة'**
  String get leave;

  /// No description provided for @lightTheme.
  ///
  /// In ar, this message translates to:
  /// **'الوضع الفاتح'**
  String get lightTheme;

  /// No description provided for @noResults.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد نتائج'**
  String get noResults;

  /// No description provided for @systemTheme.
  ///
  /// In ar, this message translates to:
  /// **'وضع النظام'**
  String get systemTheme;

  /// No description provided for @theme.
  ///
  /// In ar, this message translates to:
  /// **'الوضع'**
  String get theme;

  /// No description provided for @unsavedChanges.
  ///
  /// In ar, this message translates to:
  /// **'تغييرات غير محفوظة'**
  String get unsavedChanges;

  /// No description provided for @unsavedChangesWarning.
  ///
  /// In ar, this message translates to:
  /// **'توجد لديك تغييرات غير محفوظة، هل تريد مغادرة هذه الصفحة؟'**
  String get unsavedChangesWarning;
}

class _HelperLocalizationsDelegate extends LocalizationsDelegate<HelperLocalizations> {
  const _HelperLocalizationsDelegate();

  @override
  Future<HelperLocalizations> load(Locale locale) {
    return SynchronousFuture<HelperLocalizations>(lookupHelperLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_HelperLocalizationsDelegate old) => false;
}

HelperLocalizations lookupHelperLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return HelperLocalizationsAr();
    case 'en': return HelperLocalizationsEn();
  }

  throw FlutterError(
    'HelperLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
