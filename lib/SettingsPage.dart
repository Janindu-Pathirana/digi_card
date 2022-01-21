import 'package:digi_card/DataCRUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'Buttons.dart';
import 'CustomTextField.dart';
import 'Data.dart';
import 'HomePage.dart';

// todo: check CSV files for the options

enum Field { Mobile, Email }

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

    Map<String, String> email = userData.Email;

    if (email.isNotEmpty) {
      email.forEach((key, value) {
        list.add(
          CustonTextFields(
            id: key,
            suffixAction: (String id) {
              userData.removeEmail(id);
              setState(() {});
            },
            sufIcon: Icons.remove,
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
    }
    list.add(CustomAddButton(
      onPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomPopUpBox(
              field: Field.Email,
              title: "Email Address",
              firstFieldHint: "Add Email Type",
              firstFirldLable: "Email Type",
              secondFieldLable: "Email Address",
              secondFirldHint: "Add Email Address",
              secondFieldType: TextInputType.emailAddress,
            );
          },
        );
      },
    ));

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

    Map<String, String> mobile = userData.Mobile;

    if (mobile.isNotEmpty) {
      mobile.forEach((key, value) {
        list.add(
          CustonTextFields(
            id: key,
            suffixAction: (String id) {
              userData.removeMobile(id);
              setState(() {});
            },
            sufIcon: Icons.remove,
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
    }

    list.add(CustomAddButton(onPress: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomPopUpBox(
            field: Field.Mobile,
            title: "Mobile Number",
            firstFieldHint: "Add Mobile Type",
            firstFirldLable: "Mobile Type",
            secondFieldLable: "Number",
            secondFirldHint: "Add Mobile Number",
            secondFieldType: TextInputType.phone,
          );
        },
      );
    }));

    return list;
  }

  void save() {
    userData..Mobile = mobileNoEditingMap;
    userData..Email = emailEditingMap;

    if (dpName.isNotEmpty) userData..dPName = dpName;
    if (fName.isNotEmpty) userData..firstName = fName;
    print(userData.firstName);
    if (sName.isNotEmpty) userData..secondName = sName;
    userData..prifix = pr.replaceAll(".", "");

    DataCRUD.storeData();

    Navigator.popAndPushNamed(context, HomePage.id);
  }

  @override
  void initState() {
    Map<String, String> mobile = userData.Mobile;

    mobileNoEditingMap = mobile;

    Map<String, String> email = userData.Email;

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
                                  initStage: userData.prifix,
                                  onChanged: (value) {
                                    pr = value;
                                  },
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "Display Name",
                                  hintText: "Enter your Display Name",
                                  initStage: userData.dPName,
                                  onChanged: (value) {
                                    dpName = value;
                                  },
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "First Name",
                                  hintText: "Enter your First Name",
                                  initStage: userData.firstName,
                                  onChanged: (value) {
                                    fName = value;
                                  },
                                ),
                                SizedBox(height: 10),
                                CustonTextFields(
                                  lable: "Second Name",
                                  hintText: "Enter your Second Name",
                                  initStage: userData.secondName,
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

class CustomPopUpBox extends StatefulWidget {
  final String title;
  final String firstFirldLable;
  final String firstFieldHint;
  final String secondFieldLable;
  final String secondFirldHint;
  final TextInputType secondFieldType;

  final Field field;
  // todo: add field to get weather this one is mobile or not

  const CustomPopUpBox(
      {Key? key,
      required this.title,
      required this.firstFirldLable,
      required this.firstFieldHint,
      required this.secondFieldLable,
      required this.secondFirldHint,
      required this.secondFieldType,
      required this.field})
      : super(key: key);

  @override
  _CustomPopUpBoxState createState() => _CustomPopUpBoxState();
}

class _CustomPopUpBoxState extends State<CustomPopUpBox> {
  String firstFieldVal = "";
  String secondFieldVal = "";
  String errorText = "";

  //   // todo: this one shoulbe for mobile only

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "${widget.title}",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustonTextFields(
              lable: '${widget.firstFirldLable}',
              hintText: '${widget.firstFieldHint}',
              inputType: TextInputType.text,
              errorText: errorText.isEmpty ? null : errorText,
              onChanged: (val) {
                firstFieldVal = val;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustonTextFields(
              lable: '${widget.secondFieldLable}',
              hintText: '${widget.secondFirldHint}',
              inputType: widget.secondFieldType,
              onChanged: (val) {
                secondFieldVal = val;
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {
                      switch (widget.field) {
                        case Field.Mobile:
                          {
                            errorText = userData.checkMobile(firstFieldVal);
                            if (errorText.isEmpty) {
                              userData.addMobile(firstFieldVal, secondFieldVal);

                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SettingsPage.id,
                                  ModalRoute.withName(HomePage.id));
                            }

                            break;
                          }
                        case Field.Email:
                          {
                            errorText = userData.checkEmail(firstFieldVal);
                            if (errorText.isEmpty) {
                              userData.addEmail(firstFieldVal, secondFieldVal);

                              Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SettingsPage.id,
                                  ModalRoute.withName(HomePage.id));
                            }

                            break;
                          }
                      }

                      setState(() {});
                      print("Error is :$errorText");
                    },
                    text: "Add",
                    width: 70,
                    height: 35,
                    fontSize: 15,
                  ),
                  CustomButton(
                    backGroundColor: Colors.indigo,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: "Cancel",
                    width: 70,
                    height: 35,
                    fontSize: 15,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
