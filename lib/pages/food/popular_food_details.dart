import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/app_column.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import '../../widget/big_text.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //to hide bottom and top nav bar
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,overlays :[SystemUiOverlay.top]);
    return Scaffold(
      backgroundColor: Colors.white,
      body:Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImage,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")
                ),
              ),
            ),
          ),
          //icons
          Positioned(
            top: Dimensions.width45,
            left:Dimensions.width20 ,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppICon(icon: Icons.arrow_back_ios),
                AppICon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //introduction of food
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImage-20,
            child: Container(
              padding: EdgeInsets.only(right: Dimensions.width20,left: Dimensions.width20,top: Dimensions.height20,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius30),
                  topRight: Radius.circular(Dimensions.radius30),
                ),
                color: Colors.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Chinese Side",),
                  SizedBox(height: Dimensions.height5,),
                  BigText(text: "Introduce"),
                ],
              ),
            ),
          ),
          //Expandable Text
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.pageViewTextContainer-20,
        padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height20,
            bottom: Dimensions.height20),
        decoration: BoxDecoration(
          color: AppColors.buttonBackgroundColor,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimensions.radius20*2),
            topLeft: Radius.circular(Dimensions.radius20*2),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: Dimensions.height30/2,
                  top: Dimensions.height30/2,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [
                  Icon(Icons.remove,color: AppColors.signColor,),
                  SizedBox(width: Dimensions.width10/2,),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.add,color: AppColors.signColor,),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: Dimensions.height30/2,
                  top: Dimensions.height30/2,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child : BigText(text: "\$10 | add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
