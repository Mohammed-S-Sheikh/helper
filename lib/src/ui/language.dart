import 'package:flutter/material.dart';
import 'package:helper/src/app/app.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final AppLanguage appLanguage = AppLanguage();

  @override
  void initState() {
    super.initState();
    appLanguage.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    appLanguage.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = appLanguage.locale.isArabic;

    return IconButton(
      onPressed: () => appLanguage.changeLanguage(!isArabic ? 'ar' : 'en'),
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isArabic ? 'العربية' : 'English',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.language),
        ],
      ),
    );
  }
}

class AppDirectionality extends StatefulWidget {
  const AppDirectionality({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppDirectionality> createState() => _AppDirectionalityState();
}

class _AppDirectionalityState extends State<AppDirectionality> {
  final AppLanguage appLanguage = AppLanguage();

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: appLanguage,
      builder: (context, _) => Directionality(
        textDirection:
            appLanguage.locale.isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: widget.child,
      ),
    );
  }
}
