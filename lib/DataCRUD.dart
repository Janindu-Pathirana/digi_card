import 'dart:convert';
import "dart:io";

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'Data.dart';

class DataCRUD {
  static late var _data;
  static final String filePath = 'jsonData/userData.json';

  static Future<void> readData() async {
    String jsonString = await rootBundle.loadString(filePath);
    _data = await json.decode(jsonString);
    await _createMap();
  }

  static Future<void> _createMap() async {
    user["DPName"] = _data["DPName"];
    user["First Name"] = _data["First Name"];
    user["Second Name"] = _data["Second Name"];

    List mobile = _data["Mobile"];
    List email = _data["Email"];

    Map<String, String> mobileMap = {};
    Map<String, String> emailMap = {};

    mobile.forEach((element) {
      mobileMap[element[0]] = element[1];
    });

    email.forEach((element) {
      emailMap[element[0]] = element[1];
    });

    user["Mobile"] = mobileMap;
    user["Email"] = emailMap;
  }

  static storeData() {
    String data = "{";

    data += """ "DPName": "${user["DPName"]}",
  "First Name": "${user["First Name"]}",
  "Second Name": "${user["Second Name"]}",""";

    data += """ "Mobile": [ """;

    Map<String, String> mobileMap = user["Mobile"];

    mobileMap.forEach((key, value) {
      data += """["$key", "$value"]""";
      if (mobileMap.keys.last != key) {
        data += ",";
      }
    });

    data += "],";

    data += """ "Email": [ """;

    Map<String, String> emailMap = user["Email"];

    emailMap.forEach((key, value) {
      data += """["$key", "$value"]""";
      if (emailMap.keys.last != key) {
        data += ",";
      }
    });

    data += "],";

    data += "}";

    // print(data);

    writeFile(data);
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    print(path);
    return File('$path/userData.json');
    // return File('../$filePath');
  }

  static Future<File> writeFile(String data) async {
    final file = await _localFile;

    return file.writeAsString(data);
  }
}
