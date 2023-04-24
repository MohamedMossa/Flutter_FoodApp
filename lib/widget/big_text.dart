import 'package:flutter/cupertino.dart';

import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;


  BigText({Key? key,
  this.color = const Color(0xFF5c524f),
  required this.text,
  this.size=0,
  this.overflow=TextOverflow.ellipsis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        //fontFamily: "Roboto",
        color: color,
         fontSize: size==0?size=Dimensions.font20:size,
         fontWeight: FontWeight.w500,
      ),
    );
  }
}
