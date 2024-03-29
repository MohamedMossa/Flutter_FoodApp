import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';
import 'package:get/get.dart';

import '../../controller/popular_product_controller.dart';
import '../../controller/recommended_product_controler.dart';
import '../../utils/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(width: Dimensions.width20 * 5),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          //body
          GetBuilder<CartController>(builder: (_cartController){
            return _cartController.getItems.length>0?Positioned(
              top: Dimensions.height20 * 5,
              left: Dimensions.width20,
              right: Dimensions.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                //color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (cartController) {
                    final _cartList = cartController.getItems;
                    return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.maxFinite,
                          height: Dimensions.height20 * 5,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  var popularIndex = Get.find<PopularProductController>()
                                      .popularProductList.indexOf(_cartList[index].product!);
                                  if (popularIndex>=0){
                                    Get.toNamed(RouteHelper.getPopularFood(popularIndex,"cart-page"));
                                  }else{
                                    var recommendedIndex = Get.find<RecommendedProductController>()
                                        .recommendedProductList.indexOf(_cartList[index].product!);
                                    if(recommendedIndex<0){
                                      Get.snackbar(
                                        "History Product",
                                        "product review is not available for history products",
                                        backgroundColor: AppColors.mainColor,
                                        colorText: Colors.white,
                                      );
                                    }else{
                                      Get.toNamed(RouteHelper.getRecommendedFood(recommendedIndex,'cart-page'));

                                    }
                                  }

                                },
                                child: Container(
                                  width: Dimensions.height20 * 5,
                                  height: Dimensions.height20 * 5,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height10),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              AppConstants.BASE_URL +
                                                  AppConstants.UPLOAD_URL +
                                                  cartController
                                                      .getItems[index].img!)),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              Expanded(
                                child: Container(
                                  height: Dimensions.height20 * 5,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: cartController
                                            .getItems[index].name!,
                                        color: Colors.black54,
                                      ),
                                      SmallText(text: "Spicy"),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          BigText(
                                            text: cartController
                                                .getItems[index].price
                                                .toString(),
                                            color: Colors.redAccent,
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(
                                              right: Dimensions.height10,
                                              left: Dimensions.height10,
                                              top: Dimensions.height10,
                                              bottom: Dimensions.height10,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  Dimensions.radius20),
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    cartController.addItem(_cartList[index].product!, -1);
                                                  },
                                                  child: Icon(Icons.remove,color: AppColors.signColor,),
                                                ),
                                                SizedBox(width: Dimensions.width10 / 2),
                                                BigText(text: _cartList[index].quantity.toString()),
                                                //popularProduct.inCartItems.toString()),
                                                SizedBox(
                                                    width:
                                                    Dimensions.width10 / 2),
                                                GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(_cartList[index].product!, 1);                                                    },
                                                    child: Icon(Icons.add, color: AppColors.signColor))
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  ),
                ),
              ),
            )
                :NoDataPage(text: "Your Cart is Empty!");
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
        return Container(
          height: Dimensions.bottomHeightBar,
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
          child: cartController.getItems.length>0?Row(
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
                borderRadius: BorderRadius.circular(Dimensions.radius20),
              ),
              child: Row(
                children: [

                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),
                  BigText(text: 'SR ${cartController.totalAmount}'),
                  SizedBox(
                    width: Dimensions.width10 / 2,
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                // popularProduct.addItem(product);
                cartController.addToHistory();
              },
              child: Container(
                padding: EdgeInsets.only(right: Dimensions.height20, left: Dimensions.height20, top: Dimensions.height20, bottom: Dimensions.height20),
                child: BigText(
                    text: 'Check out',
                    color: Colors.white),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
              ),
            ),
          ],
        ):SizedBox()
        );
      }),

    );
  }
}
