import 'package:digi_card/Assets.dart';
import 'package:digi_card/BeginSetupPages/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'DataCRUD.dart';
import 'HomePage.dart';

class LoaddingScreen extends StatefulWidget {
  static String id = "LoaddingScreen";

  @override
  _LoaddingScreenState createState() => _LoaddingScreenState();
}

class _LoaddingScreenState extends State<LoaddingScreen> {
  Future<void> readData() async {
    bool available = await DataCRUD.checkAavailability();

    print("Available is $available");
    if (available) {
      await DataCRUD.readData();
      Navigator.popAndPushNamed(context, HomePage.id);
    } else {
      Navigator.popAndPushNamed(context, FirstPage.id);
    }

    await Future.delayed(Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    readData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Logo(),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 45,
              height: 45,
              child: LoadingIndicator(
                indicatorType: Indicator.ballRotateChase,
                colors: [Colors.lightBlueAccent],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
