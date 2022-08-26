import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

//make a reusable Text property
class BigText extends StatelessWidget {

  Color? color;
  final String text;
  double size;
  TextOverflow overflow;

  BigText({Key? key,
    this.color = const Color(0xFF332d2b),
    required this.text,
    this.size=0,
    this.overflow=TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,  //if text is too long it show as a doted abc..
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w300,
        fontSize: size==0? Dimensions.font20 :size,
      ),
    );
  }
}
