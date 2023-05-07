import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/controller/popular_product_controller.dart';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import 'package:get/get.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../widget/app_column.dart';
import '../../widget/big_text.dart';
import '../../widget/expandable_text_widgit.dart';


class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({Key? key,required this.pageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(Get.find<CartController>());

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
                  image: NetworkImage(
                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+product.img!
                  ),
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
              GestureDetector(
                onTap:(){
                  Get.to(()=>MainFoodPage());
                },
                  child: AppIcon(icon: Icons.arrow_back_ios,)),
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
                  AppColumn(text:product.name!),
                  SizedBox(height:Dimensions.height20),
                  BigText(text: 'Introduce'),
                    SizedBox(height: Dimensions.height20,),
                    Expanded(
                       child: SingleChildScrollView(
                           child: ExpandableTextWidget(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
        return Container(
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
                    GestureDetector(
                      onTap: () {
                      popularProduct.setQuantity(false);
                      },
                    child: Icon(Icons.remove, color: AppColors.signColor,)),
                    SizedBox(width: Dimensions.width10 / 2,),
                    Text('${popularProduct.quantity}'),
                    SizedBox(width: Dimensions.width10 / 2,),
                    GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add, color: AppColors.signColor))
                    ],
                  ),
                ),
                Container(
                child: GestureDetector(
                  onTap: (){
                    popularProduct.addItem(product);
                  },
                    child: BigText(text: '\$ ${product.price!} | add to cart',color: Colors.white)),
                padding: EdgeInsets.only(right: Dimensions.height20,left: Dimensions.height20,top: Dimensions.height20,bottom: Dimensions.height20),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),

              ),
            ],
          ),
        );
      })
    );
  }
}
