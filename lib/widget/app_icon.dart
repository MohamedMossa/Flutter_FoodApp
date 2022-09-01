import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class AppICon extends StatelessWidget {

  final IconData icon ;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppICon({Key? key,
  required this.icon,
    this.backgroundColor = const Color(0xFFfcf4e4),
    this.iconColor = const Color(0xFF756d54),
    this.size=40
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
      color: backgroundColor,
        borderRadius: BorderRadius.circular(size/2),
      ),
      child: Icon(
        icon ,
        color: iconColor,
        size: Dimensions.iconSize16,
      ),
    );
  }
}
