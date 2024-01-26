import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controller/cart_controller.dart';
import 'package:food_delivery_app/routes/route_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/app_icon.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../moduls/cart_model.dart';



class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
  var getCartHistoryList = Get.find<CartController>()
      .getCartHistoryList().reversed.toList();
    Map<String, int> cartItemsPerOrder = Map ();
    for (int i=0; i<getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) =>++value);
      }else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
List<int> cartItemPerOrderToList(){
    return cartItemsPerOrder.entries .map((e)=>e.value).toList();
    }

  List<String> cartOrderTimeToList(){
    return cartItemsPerOrder.entries .map((e)=>e.key).toList();
  }

    List<int> itemsPerOrder = cartItemPerOrderToList(); // 3,2,3
    var listCounter=0;
    timeWidget(int index){
      var outPutDate= DateTime.now().toString();
     if(index<getCartHistoryList.length){
       DateTime parsDate =  DateFormat("yyyy-MM-dd HH:mm:ss").parse(getCartHistoryList[listCounter].time!);
       var inputDate =DateTime.parse(parsDate.toString());
       var outPutFormat =  DateFormat("MM/dd/yyy hh:mm a");
        outPutDate = outPutFormat.format(inputDate);
     }
      return  BigText(text: outPutDate);
    }
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: Dimensions.height10*10,
            color: AppColors.mainColor,
            width: double.maxFinite,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(text: "CartHistory",color: Colors.white,),
                AppIcon(icon: Icons.shopping_cart_outlined,iconColor: AppColors.mainColor,)
              ],
            ),
          ),
        GetBuilder<CartController>(builder: (_cartController){
         return _cartController.getCartHistoryList().length>0?
         Expanded(
            child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20
                ),
                child: MediaQuery.removePadding(
                  removeTop: true,
                  context: context, child: ListView(
                  children: [
                    for(int i = 0; i<itemsPerOrder.length; i++)
                      Container(
                        height: Dimensions.height30*4,
                        margin:EdgeInsets.only(bottom: Dimensions.height20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           timeWidget(listCounter),
                            SizedBox(height: Dimensions.height10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Wrap(
                                    direction: Axis.horizontal,
                                    children: List.generate(itemsPerOrder[i], (index) {
                                      if(listCounter<getCartHistoryList.length){
                                        listCounter++;
                                      }
                                      return index<=2?Container(
                                        height: Dimensions.height20*4,
                                        width: Dimensions.width20*4,
                                        margin: EdgeInsets.only(right: Dimensions.width10/2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.radius15/2),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    AppConstants.BASE_URL+AppConstants.UPLOAD_URL+getCartHistoryList[listCounter-1].img!
                                                ),
                                                fit: BoxFit.cover
                                            )
                                        ),
                                      ):Container();
                                    })


                                ),
                                Container(
                                  height: Dimensions.height20*4,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SmallText(text: "Total",color:AppColors.titleColor),
                                      BigText(text: "${itemsPerOrder[i].toString()} Items",color:AppColors.titleColor),
                                      GestureDetector(
                                        onTap: (){
                                          var orderTime = cartOrderTimeToList();
                                          Map<int,CartModel> moreOrder={};
                                          for (int j =0; j<getCartHistoryList.length; j++){
                                            if (getCartHistoryList[j].time == orderTime[i]){
                                              moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                                  CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                              );

                                            }
                                          }
                                          Get.find<CartController>().setItems=moreOrder;
                                          Get.find<CartController>().addToCartList();
                                          Get.toNamed(RouteHelper.getCartPage());

                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(horizontal: Dimensions.width10,vertical: Dimensions.height10/2),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(Dimensions.radius15/3),
                                            border: Border.all(width: 1,color: AppColors.mainColor),
                                          ),
                                          child: SmallText(text: "one more",color: AppColors.mainColor,),
                                        ),
                                      )

                                    ],
                                  ),
                                )
                              ],

                            )
                          ],
                        ),
                      )
                  ],
                ),
                )
            ),
          )
             :SizedBox(
           height: MediaQuery.of(context).size.height/1.5,
               child: Center(
                 child: NoDataPage(text: "You didn't buy any thing so far",
                            imgPath: "assets/image/empty_box.png",),
               ),
             );
        })
        ],
      ),
    );
  }
}
