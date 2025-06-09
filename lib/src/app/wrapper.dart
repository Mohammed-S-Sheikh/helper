import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helper/src/app/language.dart';
import 'package:helper/src/app/theme.dart';
import 'package:helper/src/l10n/helper_localizations.dart';

class HelperApp extends StatefulWidget {
  const HelperApp({
    super.key,
    this.theme,
    this.darkTheme,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[
      Locale('ar'),
      Locale('en', 'US'),
    ],
    this.home,
  })  : routerConfig = null,
        routerDelegate = null;

  const HelperApp.router({
    super.key,
    this.routerConfig,
    this.routerDelegate,
    this.localizationsDelegates,
    this.theme,
    this.darkTheme,
    this.supportedLocales = const <Locale>[
      Locale('ar'),
      Locale('en', 'US'),
    ],
  }) : home = null;

  final RouterConfig<Object>? routerConfig;
  final RouterDelegate<Object>? routerDelegate;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final Widget? home;

  @override
  State<HelperApp> createState() => _HelperAppState();
}

class _HelperAppState extends State<HelperApp> {
  final HelperLanguage _helperLanguage = HelperLanguage();
  final HelperTheme _helperTheme = HelperTheme();

  @override
  void initState() {
    super.initState();
    _helperLanguage.addListener(_resetApp);
    _helperTheme.addListener(_resetApp);
  }

  @override
  void dispose() {
    _helperLanguage.removeListener(_resetApp);
    _helperTheme.removeListener(_resetApp);
    super.dispose();
  }

  void _resetApp() => setState(() {});

  Iterable<LocalizationsDelegate<dynamic>> get _localizationsDelegates {
    return widget.localizationsDelegates ??
        [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ];
  }

  @override
  Widget build(BuildContext context) {
    Widget builder(BuildContext context, Widget? child) {
      return ListenableBuilder(
        listenable: _helperLanguage,
        builder: (context, _) => Directionality(
          textDirection: _helperLanguage.locale.isArabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        ),
      );
    }

    if (widget.home != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.theme,
        darkTheme: widget.darkTheme,
        themeMode: _helperTheme.mode,
        locale: HelperLanguage().locale,
        localizationsDelegates: _localizationsDelegates,
        supportedLocales: widget.supportedLocales,
        home: widget.home,
        builder: builder,
      );
    }

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: widget.routerConfig,
      routerDelegate: widget.routerDelegate,
      theme: widget.theme,
      darkTheme: widget.darkTheme,
      themeMode: _helperTheme.mode,
      locale: HelperLanguage().locale,
      localizationsDelegates: [
        ...HelperLocalizations.localizationsDelegates,
        ..._localizationsDelegates,
      ],
      supportedLocales: [
        ...HelperLocalizations.supportedLocales,
        ...widget.supportedLocales,
      ],
      builder: builder,
    );
  }
}
