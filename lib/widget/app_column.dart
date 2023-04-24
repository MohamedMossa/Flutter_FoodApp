import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widget/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text.dart';

class AppColumn extends StatelessWidget {
  final String text ;
  const AppColumn({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26),
        SizedBox(height: Dimensions.height10,),
        Row(children: [
          Wrap(
            children: List.generate(5,(index){
              return Icon(Icons.star,
                color: AppColors.mainColor,size: Dimensions.height15,);},
            ),
          ),
          SizedBox(width: Dimensions.width10,),
          SmallText(text: "4.5"),
          SizedBox(width: Dimensions.width10,),
          SmallText(text: "1287"),
          SizedBox(width: Dimensions.width10,),
          SmallText(text: "comments"),
        ],
        ),
        SizedBox( height: Dimensions.height20,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),

            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.access_time_outlined,
                text: "32min",
                iconColor: AppColors.iconColor2),
          ],
        ),
      ],
    );
  }
}





