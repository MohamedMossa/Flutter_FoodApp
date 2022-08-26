import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class PopularFoodDetails extends StatelessWidget {
  const PopularFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              height: Dimensions.popularFoodImage,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
