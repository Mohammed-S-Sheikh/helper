import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:helper/src/app/language.dart';
import 'package:helper/src/app/theme.dart';

class HelperWrapper extends StatefulWidget {
  const HelperWrapper({
    super.key,
    this.theme,
    this.darkTheme,
    this.home,
  })  : routerConfig = null,
        routerDelegate = null;

  const HelperWrapper.router({
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
  State<HelperWrapper> createState() => _HelperWrapperState();
}

class _HelperWrapperState extends State<HelperWrapper> {
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
        themeMode: _helperTheme.mode,
        locale: HelperLanguage().locale,
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
      themeMode: _helperTheme.mode,
      locale: HelperLanguage().locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: const [Locale('ar'), Locale('en')],
      builder: builder,
    );
  }
}
