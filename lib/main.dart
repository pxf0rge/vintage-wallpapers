import 'package:coderspace/coderspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentations/screen_vintage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppTheme.setLightColors(
    CoderColor(
      primary: Color(0xFF0B0B0B),
      background: Color(0xFF000000),
      card: Color(0xFF0F0F10),
      cardText: Color(0xFFFFFFFF),
      text: Color(0xFFFFFFFF),
      accent: Color(0xFFEF5401),
      accentText: Color(0xFFFFFFFF),
    ),
  );
  AppTheme.useDark();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
    ),
  );
  runApp(const Vintage());
}

final GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

class Vintage extends StatelessWidget {
  const Vintage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WallyImage',
      key: globalNavigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppTheme.colors.background,
        canvasColor: AppTheme.colors.background,
        cardColor: AppTheme.colors.card,
        primaryColor: AppTheme.colors.primary,
        useMaterial3: false,
        appBarTheme: AppBarTheme(backgroundColor: AppTheme.colors.background, foregroundColor: AppTheme.colors.text, centerTitle: false),
      ),
      themeMode: ThemeMode.dark,
      home: ScreenVintage(),
    );
  }
}
