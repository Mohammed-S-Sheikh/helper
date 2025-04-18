import 'package:flutter/material.dart';
import 'package:helper/src/app/app.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  final HelperLanguage _helperLanguage = HelperLanguage();

  @override
  void initState() {
    super.initState();
    _helperLanguage.addListener(_onLanguageChanged);
  }

  @override
  void dispose() {
    _helperLanguage.removeListener(_onLanguageChanged);
    super.dispose();
  }

  void _onLanguageChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = _helperLanguage.locale.isArabic;

    return IconButton(
      onPressed: () => _helperLanguage.changeLanguage(!isArabic ? 'ar' : 'en'),
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
