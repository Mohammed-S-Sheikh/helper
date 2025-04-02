import 'package:flutter/material.dart';
import 'package:helper/src/app/app.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = AppLanguage().locale.isArabic;

    return PopupMenuButton<String>(
      icon: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isArabic ? 'AR' : 'EN',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.language),
        ],
      ),
      onSelected: AppLanguage().changeLanguage,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'en',
          child: Row(
            children: [
              if (!isArabic) const Icon(Icons.check, size: 18),
              const SizedBox(width: 8),
              const Text('English'),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'ar',
          child: Row(
            children: [
              if (isArabic) const Icon(Icons.check, size: 18),
              const SizedBox(width: 8),
              const Text('العربية'),
            ],
          ),
        ),
      ],
    );
  }
}
