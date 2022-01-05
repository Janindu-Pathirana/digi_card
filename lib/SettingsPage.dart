import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  static String id = "SettingsPage";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        "DigiCard",
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  ),
                )
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
