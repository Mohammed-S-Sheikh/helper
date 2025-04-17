import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helper/src/app/language.dart';
import 'package:helper/src/app/theme.dart';

class AppWrapper extends StatefulWidget {
  const AppWrapper({
    super.key,
    this.theme,
    this.darkTheme,
    this.home,
  })  : routerConfig = null,
        routerDelegate = null;

  const AppWrapper.router({
    super.key,
    this.routerConfig,
    this.routerDelegate,
    this.theme,
    this.darkTheme,
  }) : home = null;

  final RouterConfig<Object>? routerConfig;
  final RouterDelegate<Object>? routerDelegate;
  final ThemeData? theme;
  final ThemeData? darkTheme;
  final Widget? home;

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  final AppLanguage _appLanguage = AppLanguage();
  final AppTheme _appTheme = AppTheme();

  @override
  void initState() {
    super.initState();
    _appLanguage.addListener(_resetApp);
    _appTheme.addListener(_resetApp);
  }

  @override
  void dispose() {
    _appLanguage.removeListener(_resetApp);
    _appTheme.removeListener(_resetApp);
    super.dispose();
  }

  void _resetApp() => setState(() {});

  @override
  Widget build(BuildContext context) {
    Widget builder(BuildContext context, Widget? child) {
      return ListenableBuilder(
        listenable: _appLanguage,
        builder: (context, _) => Directionality(
          textDirection: _appLanguage.locale.isArabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: child!,
        ),
      );
    }

    const localizationsDelegates = [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];

    if (widget.home != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: widget.theme,
        darkTheme: widget.darkTheme,
        themeMode: _appTheme.mode,
        locale: AppLanguage().locale,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: const [Locale('ar'), Locale('en')],
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
      themeMode: _appTheme.mode,
      locale: AppLanguage().locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: const [Locale('ar'), Locale('en')],
      builder: builder,
    );
  }
}
