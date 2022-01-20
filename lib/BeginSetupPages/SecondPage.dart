import 'package:digi_card/Assets.dart';
import 'package:digi_card/Buttons.dart';
import 'package:digi_card/CustomTextField.dart';
import 'package:digi_card/Data.dart';
import 'package:digi_card/DataCRUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HomePage.dart';

class SecondPage extends StatefulWidget {
  static String id = "SecondPage";

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  String error = "";
  String fName = "";
  String sName = "";
  String pr = "";

  void check() {
    if (fName.isEmpty || sName.isEmpty) {
      setState(() {
        error = "Names Cant be empty";
      });
    } else {
      setState(() {
        error = "";
      });

      userData.firstName = fName;
      userData.secondName = sName;
      userData.prifix = pr;
      userData.dPName = "$fName $sName";

      //
      // user["First Name"] = fName;
      // user["Second Name"] = sName;
      // user["Pr"] = pr;
      // user["DPName"] = "$fName $sName";

      DataCRUD.storeData();

      Navigator.popAndPushNamed(context, HomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: mainPadding),
          width: double.maxFinite,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Logo(),
                SizedBox(
                  height: 60,
                ),
                CustonTextFields(
                  lable: "Prefix",
                  hintText: "Enter Prefix",
                  onChanged: (val) {
                    pr = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustonTextFields(
                  lable: "First Name",
                  hintText: "Enter First Name",
                  onChanged: (val) {
                    fName = val;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustonTextFields(
                    lable: "Second Name",
                    hintText: "Enter Second Name",
                    onChanged: (val) {
                      sName = val;
                    }),
                if (error.isNotEmpty)
                  ErrorContainer(
                    ErrorText: error,
                  ),
                CustomButton(
                    onTap: () {
                      check();
                    },
                    text: "Next")
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorContainer extends StatelessWidget {
  final String ErrorText;

  const ErrorContainer({Key? key, required this.ErrorText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(
        "$ErrorText",
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
      ),
    );
  }
}
