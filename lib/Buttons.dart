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
