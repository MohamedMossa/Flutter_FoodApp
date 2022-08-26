import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/small_text.dart';
import '../../widget/big_text.dart';
import 'food_page_body.dart';



class MainFoodPage extends StatefulWidget {
  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
print("current height is "+MediaQuery.of(context).size.height.toString());
   double w = MediaQuery.of(context).size.width;
   double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          //showing the header
          Container(
            child: Container(
              margin: EdgeInsets.only(top: Dimensions.height30, bottom: Dimensions.height15),
              padding: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "Saudi Arabia",
                        color: AppColors.mainColor,
                        size: 25,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "Jeddah",
                            color: Colors.black54,
                          ),
                          Icon( Icons.arrow_drop_down_rounded,color: Colors.black,size: Dimensions.iconSize24,),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: Dimensions.width45,
                    height: Dimensions.height45,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius15),
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //showing th body
          Expanded(child: SingleChildScrollView(
              child: FoodPageBody())),
        ],
      ),
    );
  }
}
