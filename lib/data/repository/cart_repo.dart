import 'dart:convert';

import 'package:food_delivery_app/moduls/cart_model.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo{

  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  // data saved in this list after check out
  List<String> cartHistory=[];
  

  // add cart items in local Storage
  void addToCartList(List<CartModel> cartList){
    //sharedPreferences.remove(AppConstants.CART_LIST);
    //sharedPreferences.remove(AppConstants.CART_History_LIST);
   String time = DateTime.now().toString();
      cart=[];
      cartList.forEach((element) {
        element.time=time;
        // convert object to String with jsonEncode method
        return cart.add(jsonEncode(element));
      });
      
      sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
     // print(sharedPreferences.get("Cart-List"));
    //getCartList();
  }

  // Get Cart Items from local Storage

List<CartModel> getCartList(){
 List<String> carts=[];
   if( sharedPreferences.containsKey(AppConstants.CART_LIST)){
   carts= sharedPreferences.getStringList(AppConstants.CART_LIST)!;
 }
 List<CartModel> cartList=[];
   carts.forEach((element) {
     // convert String to Object with jsonDecode method

     return cartList.add(CartModel.fromJson(jsonDecode(element)));
   });

 return cartList;


}

List<CartModel> getCartHistoryList(){
   if(sharedPreferences.containsKey(AppConstants.CART_History_LIST)) {
     cartHistory=[];
     cartHistory= sharedPreferences.getStringList(AppConstants.CART_History_LIST)!;
  }
   List<CartModel> cartListHistory=[];
   cartHistory.forEach((element) =>cartListHistory.add(CartModel.fromJson(jsonDecode(element))));
   return cartListHistory;
}

void addToCartHistoryList(){
    if(sharedPreferences.containsKey(AppConstants.CART_History_LIST)){
      cartHistory=sharedPreferences.getStringList(AppConstants.CART_History_LIST)!;
    }
    for (int i=0; i<cart.length; i++){
      print("cart history "+cart[i]);
      cartHistory.add(cart[i]);
    }
    removeCart();
    sharedPreferences.setStringList(AppConstants.CART_History_LIST, cartHistory);
    print("The Length of history List "+ getCartHistoryList().length.toString());
   for (int j=0; j<getCartHistoryList().length; j++ ){
     print("the time for the order is "+ getCartHistoryList()[j].time.toString());
   }
}

//delete data form shared prefrences
void removeCart(){
    cart=[];
    sharedPreferences.remove(AppConstants.CART_LIST);

}


}