import 'package:digi_card/BeginSetupPages/SecondPage.dart';
import 'package:flutter/material.dart';

import '../Assets.dart';
import '../Buttons.dart';

class FirstPage extends StatefulWidget {
  static String id = "FirstPage";

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(),
              SizedBox(
                height: 60,
              ),
              Text(
                "Welcome",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              SizedBox(
                height: 100,
              ),
              CustomButton(
                onTap: () {
                  Navigator.popAndPushNamed(context, SecondPage.id);
                },
                text: "Start",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
