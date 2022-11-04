import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/adkhar_provider.dart';
import 'package:quran_app/providers/tasbih_provider.dart';
import 'package:quran_app/screens/main_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:quran_app/view_models/surah_of_time.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [Locale("ar"), Locale("en")],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TasbihProvider()),
        ChangeNotifierProvider(
          create: (context) => AdhkarProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
