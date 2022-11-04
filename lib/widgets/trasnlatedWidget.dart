import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChooseLanguage extends StatefulWidget {
  ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  Object? _groupValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        RadioListTile(
            title: Text(
              "العربيه 🇸🇦",
              style: TextStyle(fontSize: 20),
            ),
            value: "العربيه",
            groupValue: _groupValue,
            onChanged: (value) {
              _groupValue = value;
              context.setLocale(Locale("ar"));
            }),
        RadioListTile(
            title: Text(
              "English 🇺🇸",
              style: TextStyle(fontSize: 20),
            ),
            value: "English",
            groupValue: _groupValue,
            onChanged: (value) {
              setState(() {
                _groupValue = value;
                context.setLocale(Locale("en"));
              });
            })
      ],
    );
  }
}
