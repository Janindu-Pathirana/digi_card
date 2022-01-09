import 'package:digi_card/DataCRUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CustomTextField.dart';
import 'Data.dart';
import 'HomePage.dart';

// todo: add Mr. Ms tag to chage, check CSV files for the options

class SettingsPage extends StatefulWidget {
  static String id = "SettingsPage";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String dpName = "";
  String fName = "";
  String sName = "";
  String pr = "";
  Map<String, String> mobileNoEditingMap = {};
  Map<String, String> emailEditingMap = {};

  List<Widget> getEmails() {
    List<Widget> list = [
      Text(
        "Emails",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 10),
    ];

    Map<String, String> mobile = user["Email"];

    mobile.forEach((key, value) {
      list.add(
        CustonTextFields(
          inputType: TextInputType.emailAddress,
          lable: "$key",
          hintText: "Enter $key Email",
          initStage: "$value",
          onChanged: (value) {
            emailEditingMap[key] = value;
          },
        ),
      );

      list.add(
        SizedBox(height: 10),
      );
    });

    return list;
  }

  List<Widget> getMobileNumbers() {
    List<Widget> list = [
      Text(
        "Mobile Numbers",
        style: TextStyle(fontSize: 18),
      ),
      SizedBox(height: 10),
    ];

    Map<String, String> mobile = user["Mobile"];

    mobile.forEach((key, value) {
      list.add(
        CustonTextFields(
          inputType: TextInputType.number,
          lable: "$key",
          hintText: "Enter $key No",
          initStage: "$value",
          onChanged: (value) {
            mobileNoEditingMap[key] = value;
          },
        ),
      );

      list.add(
        SizedBox(height: 10),
      );
    });

    return list;
  }

  void save() {
    user["Mobile"] = mobileNoEditingMap;
    user["Email"] = emailEditingMap;

    if (dpName.isNotEmpty) user["DPName"] = dpName;
    if (fName.isNotEmpty) user["First Name"] = fName;
    print(user["First Name"]);
    if (sName.isNotEmpty) user["Second Name"] = sName;
    user["Pr"] = pr.replaceAll(".", "");

    DataCRUD.storeData();

    Navigator.popAndPushNamed(context, HomePage.id);
  }

  @override
  void initState() {
    Map<String, String> mobile = user["Mobile"];

    mobileNoEditingMap = mobile;

    Map<String, String> email = user["Email"];

    emailEditingMap = email;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: mainPadding),
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
                      "Settings",
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
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: Stack(
                    children: [
                      ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                  "Name",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "Prefix",
                                  hintText: "Enter your Prefix",
                                  initStage: user["Pr"],
                                  onChanged: (value) {
                                    pr = value;
                                  },
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "Display Name",
                                  hintText: "Enter your Display Name",
                                  initStage: user["DPName"],
                                  onChanged: (value) {
                                    dpName = value;
                                  },
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "First Name",
                                  hintText: "Enter your First Name",
                                  initStage: user["First Name"],
                                  onChanged: (value) {
                                    fName = value;
                                  },
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "Second Name",
                                  hintText: "Enter your Second Name",
                                  initStage: user["Second Name"],
                                  onChanged: (value) {
                                    sName = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: getMobileNumbers(),
                            ),
                          ),
                          Container(
                            child: Column(
                              children: getEmails(),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: TextButton(
                              onPressed: () {
                                save();
                              },
                              child: Container(
                                width: 100,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.lightBlueAccent),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
