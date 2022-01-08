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
    await DataCRUD.readData();
    await Future.delayed(Duration(seconds: 2));
    Navigator.popAndPushNamed(context, HomePage.id);
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
            )
          ],
        ),
      )),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/logo.png"))),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "DigiCard",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
      ],
    );
  }
}
