import 'package:get/get.dart';
class Dimensions{

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;


  static double pageView = screenHeight/2.64;              //320 px
  static double pageViewContainer = screenHeight/3.84;    //220 px
  static double PageTextContainer = screenHeight/7.03;    //120 px

  //DynamicHeight
  static double height10 = screenHeight/84.4;
  static double height15 = screenHeight/56.26;
  static double height20 = screenHeight/42.2;
  static double height30 = screenHeight/28.13;
  static double height45 = screenHeight/18.75;

  //DynamicWidth
  static double width10 = screenWidth/39;
  static double width15 = screenWidth/26;
  static double width20 = screenWidth/19.5;
  static double width30 = screenWidth/13;
  static double width45 = screenWidth/8.67;

  //font
  static double font16 = screenHeight/52.75;
  static double font20 = screenHeight/42.2;
  static double font26 = screenHeight/32.46;


  //radius
  static double radius15 = screenHeight/56.26;
  static double radius20 = screenHeight/42.2;
  static double radius30 = screenHeight/28.13;

  //icon size
  static double iconSize24 =screenHeight/35.16;
  static double iconSize16 =screenHeight/52.75;


  // list view size
  static double listViewImgSize =screenWidth/3.25;          //120 px
  static double listViewTextContSize =screenWidth/3.9;      //100 px

  //popular food
  static double popularFoodImgSize = screenHeight/2.41;     //350 px
 //bottom height tbar
  static double bottomHeightBar = screenHeight/7.03;    //120 px

 // splash Screen dimensions
  static double splashImg = screenHeight/3.38;

}