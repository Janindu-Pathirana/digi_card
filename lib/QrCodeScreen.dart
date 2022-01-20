import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'Data.dart';

class QrCodeScreen extends StatefulWidget {
  static String id = "QrCodeScreen";

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String getVCF() {
    // String VCF =
    //     """BEGIN:VCARD\nVERSION:4.0 \nN:${user["First Name"]};${user["Second Name"]};;${user["Pr"]}.;\nFN:${user["First Name"]} ${user["Second Name"]}""";
    String VCF =
        """BEGIN:VCARD\nVERSION:4.0 \nN:${userData.firstName};${userData.secondName};;${userData.prifix}.;\nFN:${userData.firstName} ${userData.secondName}""";

    Map<String, String> mobile = userData.Mobile;
    String phoneNo = "";
    for (int i = 0; i < mobile.length; i++) {
      String val = mobile.values.elementAt(i);
      phoneNo += "\nTEL;TYPE,voice;VALUE#uri:tel:$val";
    }
    VCF += phoneNo;

    Map<String, String> email = userData.Email;
    String emailID = "";
    for (int i = 0; i < email.length; i++) {
      String val = email.values.elementAt(i);
      emailID += "\nEMAIL:$val";
    }
    VCF += emailID;

    VCF += "\nEND:VCARD";

    return VCF;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: mainPadding),
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
                  Text(
                    "GigiCard",
                    style: TextStyle(color: Colors.black, fontSize: 20),
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
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20)),
                      child: QrImage(
                        data: getVCF(),
                        version: QrVersions.auto,
                        foregroundColor: Colors.black,
                      ),
                    ),
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
