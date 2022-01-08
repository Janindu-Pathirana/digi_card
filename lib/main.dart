import 'package:digi_card/BeginSetupPages/FirstPage.dart';
import 'package:digi_card/BeginSetupPages/SecondPage.dart';
import 'package:digi_card/HomePage.dart';
import 'package:digi_card/LoardingScreen.dart';
import 'package:digi_card/QrCodeScreen.dart';
import 'package:digi_card/SettingsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoaddingScreen.id,
      routes: {
        FirstPage.id: (context) => FirstPage(),
        SecondPage.id: (context) => SecondPage(),
        LoaddingScreen.id: (context) => LoaddingScreen(),
        HomePage.id: (context) => HomePage(),
        QrCodeScreen.id: (context) => QrCodeScreen(),
        SettingsPage.id: (context) => SettingsPage(),
      },
    );
  }
}
