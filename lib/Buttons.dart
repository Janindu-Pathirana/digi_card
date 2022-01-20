import 'package:flutter/material.dart';

import 'Data.dart';

class ImageButton extends StatelessWidget {
  final String name;
  final String image;
  final Function? onTap;

  ImageButton({Key? key, required this.name, required this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onTap!();
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                boxShadow: shadow,
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)),
            child: Image.asset(image),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "$name",
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        )
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color backGroundColor;
  final Color textColor;
  final double fontSize;
  final double width;
  final double height;

  CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.backGroundColor = Colors.lightBlueAccent,
    this.textColor = Colors.white,
    this.fontSize = 18,
    this.height = 50,
    this.width = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onTap();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: backGroundColor, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            "$text",
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ),
      ),
    );
  }
}

class CustomAddButton extends StatelessWidget {
  final Function onPress;

  const CustomAddButton({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPress();
        },
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent, shape: BoxShape.circle),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}
