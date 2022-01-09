import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

double mainPadding = 20;

enum socialMedia { Facebook, InsterGram, Linkdin }

List<BoxShadow> shadow = [
  BoxShadow(
    color: Colors.black12,
    offset: Offset(2.5, 2.5),
    blurRadius: 1,
    spreadRadius: 0.5,
  )
];

Map<String, dynamic> user = {
  "Pr": "Mr",
  "DPName": "-",
  "First Name": "-",
  "Second Name": "-",
  "Mobile": {"Home": "-", "Mobile": "-"},
  "Email": {"Home": "-", "Other": "-"},
};
