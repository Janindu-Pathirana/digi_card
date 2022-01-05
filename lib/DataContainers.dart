import 'package:digi_card/Data.dart';
import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final String title;
  final List<List<String>> dataList;

  const DataContainer({Key? key, required this.title, required this.dataList})
      : super(key: key);

  List<Widget> setColumn() {
    List<Widget> list = [
      Text(
        "$title",
        style: TextStyle(fontSize: 15, color: Colors.black),
      ),
      SizedBox(
        height: 15,
      ),
    ];

    for (int i = 0; i < dataList.length; i++) {
      String dataName = dataList[i][0];
      String data = dataList[i][1];

      list.add(
        DataRow(dataName: dataName, val: data),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white54,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: setColumn(),
          ),
        ),
      ),
    );
  }
}

class DataRow extends StatelessWidget {
  final String dataName;
  final String val;

  const DataRow({Key? key, required this.dataName, required this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$dataName",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          Text(
            "$val",
            style: TextStyle(fontSize: 15, color: Colors.black),
          )
        ],
      ),
    );
  }
}
