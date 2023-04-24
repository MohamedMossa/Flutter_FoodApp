
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import '../../utils/colors.dart';
import '../../widget/app_column.dart';
import '../../widget/big_text.dart';
import '../../widget/expandable_text_widgit.dart';


class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //show background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png"),
                ),
              ),
            ),
          ),
          //show icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              AppIcon(icon: Icons.arrow_back_ios,),
              AppIcon(icon: Icons.shopping_cart_outlined,)
              ],
            ),
          ),
          //show introduction text
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize-20,
            child: Container(
              padding: EdgeInsets.all(Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text:"Chinese Side"),
                  SizedBox(height:Dimensions.height20),
                  BigText(text: 'Introduce'),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                       child: SingleChildScrollView(
                           child: ExpandableTextWidget(text: "Chicken marinated in aspiced"
                       "yoghurt is placed in a large pot,then layered with fried"
                       " onions (cheeky easy sub below!), fresh "
                       "coriander/cilantro,then par boiled Chicken marinated in aspiced"
                               "yoghurt is placed in a large pot,then layered with fried"
                               " onions (cheeky easy sub below!), fresh "
                               "coriander/cilantro,then par boiledChicken marinated in aspiced"
                               "yoghurt is placed in a large pot,then layered with fried"
                               " onions (cheeky easy sub below!), fresh "
                               "coriander/cilantro,then par boiled"),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.buttomHeightbar,
        width: double.maxFinite,
        padding: EdgeInsets.only(right: Dimensions.width20,left:Dimensions.width20 ,top: Dimensions.height30,bottom: Dimensions.height30),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft:   Radius.circular(Dimensions.radius20*2),
            topRight:  Radius.circular(Dimensions.radius20*2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(right: Dimensions.height20,left: Dimensions.height20,top: Dimensions.height20,bottom: Dimensions.height20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  Text("0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add,color: AppColors.signColor)
                ]
              ),
            ),
            Container(
              child: BigText(text: '\$10 | add to cart',color: Colors.white),
              padding: EdgeInsets.only(right: Dimensions.height20,left: Dimensions.height20,top: Dimensions.height20,bottom: Dimensions.height20),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
