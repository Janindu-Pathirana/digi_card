import 'dart:convert';

import 'package:flutter/services.dart';

import 'Data.dart';

class DataCRUD {
  static late var _data;

  static Future<void> readData() async {
    String jsonString = await rootBundle.loadString('jsonData/userData.json');
    _data = await json.decode(jsonString);
    _createMap();
  }

  static void _createMap() {
    user["DPName"] = _data["DPName"];
    user["First Name"] = _data["First Name"];
    user["Second Name"] = _data["Second Name"];

    List<String> mobile = _data["Mobile"];
    List<String> email = _data["Email"];

    Map<String, String> mobileMap = {};
    Map<String, String> emailMap = {};

    mobile.forEach((element) {
      print(element[1]);
      user["Mobile"][element[0]] = element[1];
    });

    user["Mobile"] = mobileMap;
  }
}
