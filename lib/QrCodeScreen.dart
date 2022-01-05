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
    String VCF =
        """BEGIN:VCARD\nVERSION:4.0 \nN:${user["First Name"]};${user["Second Name"]};;Mr.;\nFN:${user["First Name"]} ${user["Second Name"]}""";

    Map<String, String> mobile = user["Mobile"];
    String phoneNo = "";
    for (int i = 0; i < mobile.length; i++) {
      String val = mobile.values.elementAt(i);
      phoneNo += "\nTEL;TYPE,voice;VALUE#uri:tel:$val";
    }
    VCF += phoneNo;

    Map<String, String> email = user["Email"];
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
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "GigiCard",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(20)),
                child: QrImage(
                  data: getVCF(),
                  version: QrVersions.auto,
                  foregroundColor: Colors.black,
                  size: 200.0,
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(
                      "Back",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    )),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
