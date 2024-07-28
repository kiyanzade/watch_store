import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:watch_store_app/components/theme.dart';
import 'package:watch_store_app/routes/routes.dart';
import 'package:watch_store_app/routes/screen_names.dart';
import 'package:watch_store_app/screens/register_screen.dart';
import 'package:watch_store_app/screens/send_otp_screen.dart';
import 'package:watch_store_app/screens/verify_otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("fa", "IR"),
      ],
      locale: const Locale("fa", "IR"),
      title: 'Flutter Demo',
      theme: lightThemeData,
      initialRoute: ScreenNames.root,
      routes: routes,
    );
  }
}
