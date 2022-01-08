import 'package:flutter/material.dart';

class CustonTextFields extends StatefulWidget {
  final String? initStage;
  final String lable;
  final String hintText;
  TextInputType? inputType = TextInputType.name;
  final Function? onChanged;

  CustonTextFields(
      {Key? key,
      this.initStage,
      required this.lable,
      required this.hintText,
      inputType,
      this.onChanged})
      : super(key: key);

  @override
  _CustonTextFieldsState createState() => _CustonTextFieldsState();
}

class _CustonTextFieldsState extends State<CustonTextFields> {
  late var controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  initState() {
    if (widget.initStage == null) {
      controller = TextEditingController();
    } else {
      controller = TextEditingController(text: "${widget.initStage}");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        child: TextField(
          controller: controller,
          onChanged: (value) {
            widget.onChanged!(value);
          },
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            label: Text("${widget.lable}"),
            hintText: "${widget.hintText}",
            hintStyle: TextStyle(color: Colors.black26),
          ),
        ));
  }
}
