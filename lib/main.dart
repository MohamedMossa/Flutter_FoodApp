import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/pages/food/popular_food_details.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  //to hide bottom and top nav bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,overlays :[SystemUiOverlay.top]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PopularFoodDetails(),
    );
  }
}
