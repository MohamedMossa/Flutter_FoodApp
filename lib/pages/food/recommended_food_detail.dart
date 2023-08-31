import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/popular_product_controller.dart';
import 'package:food_delivery_app/pages/cart/cart_page.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/expandable_text_widgit.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/recommended_product_controler.dart';
import '../../utils/colors.dart';
import '../../widget/app_icon.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product,Get.find<CartController>());


    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(
                        icon: Icons.clear,
                      )),
                  // AppIcon(
                  //   icon: Icons.shopping_cart_outlined
                  // ),
                  GetBuilder<PopularProductController>(builder: (controller){
                    return Stack(
                      children: [
                        AppIcon(icon: Icons.shopping_cart_outlined),
                        Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                            right:0,top:0,
                            child: GestureDetector(
                              onTap:(){
                                Get.to(()=>CartPage());
                              },
                              child: AppIcon(icon: Icons.circle,size:20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,),
                            ))
                            :SizedBox(),Get.find<PopularProductController>().totalItems>=1?
                        Positioned(
                          right:3,top:3,
                          child:BigText(text: Get.find<PopularProductController>().totalItems.toString(),
                            size:12,color: Colors.white,),
                        ):
                        SizedBox(),
                      ],
                    );
                  })
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(30),
                child: Container(
                  padding: EdgeInsets.only(top: 5, bottom: 10),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius20),
                        topRight: Radius.circular(Dimensions.radius20),
                      )),
                  child: Center(
                      child: BigText(
                    text: product.name!,
                    size: Dimensions.font26,
                    color: AppColors.titleColor,
                  )),
                ),
              ),
              backgroundColor: AppColors.yellowColor,
              pinned: true,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL + AppConstants.UPLOAD_URL + product.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    child: ExpandableTextWidget(text: product.description!),
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20 * 2.5,
                      right: Dimensions.width20 * 2.5,
                      top: Dimensions.height10,
                      bottom: Dimensions.height10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                          icon: Icons.remove,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                      BigText(
                        text: "\$ ${product.price!} X ${controller.inCartItems}",
                        color: AppColors.mainBlackColor,
                        size: Dimensions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                          icon: Icons.add,
                          iconColor: Colors.white,
                          iconSize: Dimensions.iconSize24,
                          backgroundColor: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.buttomHeightbar,
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                      right: Dimensions.width20,
                      left: Dimensions.width20,
                      top: Dimensions.height30,
                      bottom: Dimensions.height30),
                  decoration: BoxDecoration(
                    color: AppColors.buttonBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20 * 2),
                      topRight: Radius.circular(Dimensions.radius20 * 2),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            right: Dimensions.height20,
                            left: Dimensions.height20,
                            top: Dimensions.height20,
                            bottom: Dimensions.height20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius20),
                        ),
                        child: Row(children: [
                          Icon(
                            Icons.favorite,
                            color: AppColors.mainColor,
                          )
                        ]),
                      ),
                      GestureDetector(
                        onTap: (){
                          controller.addItem(product);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              right: Dimensions.height20,
                              left: Dimensions.height20,
                              top: Dimensions.height20,
                              bottom: Dimensions.height20),
                          child: BigText(
                              text: '\$ ${product.price!} | add to cart', color: Colors.white),

                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ));
  }
}
