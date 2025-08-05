import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:responsive_vs_adaptive/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    localization.init(
      mapLocales: [
        const MapLocale('en', AppLocale.en),
        const MapLocale('de', AppLocale.de),
      ],
      initLanguageCode: 'de',
    );
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  // the setState function here is a must to add
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive & Adaptive Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: HomePage(),
    );
  }
}

// Gerne in neue Datei auslagern
mixin AppLocale {
  static const String hello = 'hello';
  static const String login = 'login';
  static const String register = 'register';
  static const String weakPassword = 'weakPassword';
  static const String screenWidth = 'screenWidth';
  static const String screenWidthInteger = 'screenWidthInteger';

  static const Map<String, dynamic> en = {
    hello: 'Hello',
    login: 'Login',
    weakPassword: 'Your password is too weak',
    register: 'Register',
    screenWidth: 'Screen Width',
    screenWidthInteger: 'Screen Width %a',
  };

  static const Map<String, dynamic> de = {
    hello: 'Servus',
    login: 'Einloggen',
    weakPassword: 'Dein Passwort ist zu schwach',
    register: 'Registrieren',
    screenWidth: 'Bildschirmbreite',
    screenWidthInteger: 'Bildschirmbreite %a',
  };
}
