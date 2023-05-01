import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controller/popular_product_controller.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:food_delivery_app/widget/icon_and_text.dart';
import 'package:food_delivery_app/widget/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/recommended_product_controler.dart';
import '../../moduls/products_model.dart';
import '../../widget/app_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);
  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        //print("current page value : "+_currentPageValue.toString());
      });
    });
  }

  @override
  // to free up memory
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //slider sections
       GetBuilder<PopularProductController>(builder: (popularProductController){
         return popularProductController.isLoaded ? Container(
           height: Dimensions.pageView,
           child: PageView.builder(
               controller: pageController,
               itemCount: popularProductController.popularProductList.length,
               itemBuilder: (context, position) {
                 return _buildPageItem(position,popularProductController.popularProductList[position]);
               }),
         ):CircularProgressIndicator(
           color: AppColors.mainColor,
         );
       }),
        //dots
      GetBuilder<PopularProductController>(builder: (popularProductController)
      {
        return DotsIndicator(
          dotsCount: popularProductController.popularProductList.isEmpty?1:popularProductController.popularProductList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }
      ),
        //popular Text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimensions.width10,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 2),
                child: SmallText(
                  text: "Food Pairing",
                ),
              ),
            ],
          ),
        ),
        ///show list of recommended food images
       GetBuilder<RecommendedProductController>(builder: (recommendedProductController){
         return recommendedProductController.isLoaded? ListView.builder(
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount: recommendedProductController.recommendedProductList.length,
           itemBuilder: (context, index) {
             return Container(
               margin: EdgeInsets.only(
                   bottom: Dimensions.height10,
                   left: Dimensions.width20,
                   right: Dimensions.width20),
               child: Row(
                 children: [
                   //show image list
                   Container(
                     height: Dimensions.listViewImgSize,
                     width: Dimensions.listViewImgSize,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(Dimensions.radius20),
                       color: const Color(0xFFfcab88),
                       image:  DecorationImage(
                           fit: BoxFit.cover,
                           image: NetworkImage(
                               AppConstants.BASE_URL+AppConstants.UPLOAD_URL+ recommendedProductController.recommendedProductList[index].img!
                           ),),
                     ),
                   ),
                   //show cards
                   Expanded(
                     child: Container(
                       height: Dimensions.listViewTextContSize,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           topRight: Radius.circular(Dimensions.radius20),
                           bottomRight: Radius.circular(Dimensions.radius20),
                         ),
                       ),
                       child: Padding(
                         padding: EdgeInsets.only(
                             left: Dimensions.width10,
                             right: Dimensions.width10),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             BigText(text: recommendedProductController.recommendedProductList[index].name!),
                             SizedBox(
                               height: Dimensions.height10,
                             ),
                             SmallText(text: "With chinese characteristics"),
                             SizedBox(
                               height: Dimensions.height10,
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             );
           },
         ):CircularProgressIndicator(
           color: AppColors.mainColor,
         );
       })
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // for zoom in out transactions
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
              left: Dimensions.width10,
              right: Dimensions.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image:  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                 AppConstants.BASE_URL+AppConstants.UPLOAD_URL+ popularProduct.img!
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.PageTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  )
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimensions.height15, left: 15, right: 15),
                child: AppColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
