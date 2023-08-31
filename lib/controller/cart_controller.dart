import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/moduls/products_model.dart';
import 'package:get/get.dart';
import '../moduls/cart_model.dart';
import '../utils/colors.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel>_items={};
  Map<int, CartModel>get items=>_items  ;


  void addItem(ProductModel product,int quantity){
    int totalQuantity=0;
    if(_items.containsKey(product.id!)){
      _items.update(product.id!, (value) {
        totalQuantity=value.quantity!+quantity;
        return CartModel(
          id:product.id,
          name:value.name,
          price:value.price,
          img: value.img,
          quantity: value.quantity!+quantity,
          isExist:true,
          time: DateTime.now().toString(),
        );
      });

      if(totalQuantity<=0){
        _items.remove(product.id);
      }
    }else{
      if(quantity>0){
        _items.putIfAbsent(product.id!, () {
          return CartModel(
            id:product.id,
            name:product.name,
            price:product.price,
            img: product.img,
            quantity: quantity,
            isExist:true,
            time: DateTime.now().toString(),
          );
        },
        );
      }else{
        Get.snackbar("Note", "You should at least add one item in the cart!",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
  }


  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product){
    var quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems{
    var totalQuantity=0;
    _items.forEach((key, value) {
    totalQuantity=  totalQuantity+value.quantity!;
    });
    return totalQuantity;
  }

  //convert map to list
  List<CartModel> get getItems{
  return _items.entries.map((e){
     return e.value;
  }).toList();
}
}