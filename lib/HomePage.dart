import 'package:digi_card/Data.dart';
import 'package:digi_card/QrCodeScreen.dart';
import 'package:flutter/material.dart';

import 'Buttons.dart';
import 'DataContainers.dart';
import 'SettingsPage.dart';

class HomePage extends StatefulWidget {
  static String id = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<List<String>> getDataList(String data) {
    Map<String, String> mobile = user[data];

    List<List<String>> list = [];

    for (int i = 0; i < mobile.length; i++) {
      String k = mobile.keys.elementAt(i);
      String val = mobile.values.elementAt(i);

      list.add([k, val]);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: mainPadding, right: mainPadding),
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/logo.png"))),
                ),
                Text(
                  "DigiCard",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                //menue button
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SettingsPage.id);
                  },
                  child: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            //dp and name
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //name
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "${user["DPName"]}",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),

                  //button
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageButton(
                          onTap: () {
                            Navigator.pushNamed(context, QrCodeScreen.id);
                          },
                          image: "images/QR.png",
                          name: "QR",
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        ImageButton(
                          image: "images/NFC.png",
                          name: "NFC",
                        )
                      ],
                    ),
                  ),

                  //divider
                  SizedBox(
                    height: 10,
                    width: 300,
                    child: Divider(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            //data
//data
            Flexible(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: ListView(
                  children: [
                    DataContainer(
                      title: "Name",
                      dataList: [
                        ["First Name", "${user["First Name"]}"],
                        ["Second Name", "${user["Second Name"]}"],
                      ],
                    ),
                    DataContainer(
                      title: "Mobile",
                      dataList: getDataList("Mobile"),
                    ),
                    DataContainer(
                      title: "Email",
                      dataList: getDataList("Email"),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
