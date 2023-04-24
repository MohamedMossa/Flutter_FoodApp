import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/expandable_text_widgit.dart';
import 'package:food_delivery_app/widget/small_text.dart';

import '../../utils/colors.dart';
import '../../widget/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppIcon(icon: Icons.clear,),
              AppIcon(icon: Icons.shopping_cart_outlined,),
            ],
          ),
          bottom: PreferredSize(preferredSize: Size.fromHeight(30),
            child: Container(
              padding: EdgeInsets.only(top: 5,bottom: 10),
              width: double.maxFinite,
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
                )
              ),
              child: Center(child: BigText(text:"Chinese Side",size: Dimensions.font26,color:AppColors.titleColor, )),
            ),),
          backgroundColor: AppColors.yellowColor,
          pinned: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset("assets/image/food0.png",fit:BoxFit.cover,),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            margin: EdgeInsets.only(left: Dimensions.width20,right: Dimensions.width20),
            child: Column(
              children: [
                ExpandableTextWidget(text: "Chicken marinated in aspiced"
                    "yoghurt is placed in a large pot,then layered with fried"
                    " onions (cheeky easy sub below!), fresh "
                    "coriander/cilantro,then par boiled Chicken marinated in aspiced"
                    "yoghurt is placed in a large pot,then layered with fried"
                    " onions (cheeky easy sub below!), fresh "
                    "coriander/cilantro,then par boiledChicken marinated in aspiced"
                    "yoghurt is placed in a large pot,then layered with fried"
                    " onions (cheeky easy sub below!), fresh "
                    "coriander/cilantro,then par boiled""Chicken marinated in aspiced"
                    "yoghurt is placed in a large pot,then layered with fried"
                    " onions (cheeky easy sub below!), fresh "
                    "coriander/cilantro,then par boiled Chicken marinated in aspiced"
                    "yoghurt is placed in a large pot,then layered with fried"
                    " onions (cheeky easy sub below!), fresh "
                    "coriander/cilantro,then par boiledChicken marinated in aspiced"
                    "yoghurt is placed in a large pot,then layered with fried"
                    " onions (cheeky easy sub below!), fresh "
                    "coriander/cilantro,then par ")
              ],
            ),
          ),
        ),
      ],
    ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
            left: Dimensions.width20*2.5,
            right: Dimensions.width20*2.5,
            top: Dimensions.height10,
            bottom: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove,iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,),
                BigText(text: "\$12.88 "+"X "+"0 ",
                  color: AppColors.mainBlackColor,
                size: Dimensions.font26,),
                AppIcon(icon: Icons.add,iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,),
              ],
            ),

          ),
          Container(
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
                        Icon(Icons.favorite,color: AppColors.mainColor,)
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
          )
        ],
      ),
    );
  }
}
