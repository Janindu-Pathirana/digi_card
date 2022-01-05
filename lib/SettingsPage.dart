import 'package:flutter/material.dart';

import 'Data.dart';

class SettingsPage extends StatefulWidget {
  static String id = "SettingsPage";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: mainPadding),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Container(
                  child: Text(
                    "DigiCard",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"))),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: ListView(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
