import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/moduls/products_model.dart';
import 'package:get/get.dart';

import '../moduls/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel>_items={};

  void addItem(ProductModel product,int quantity){
    _items.putIfAbsent(product.id!, () {
      print("adding item to cart "+product.id.toString()+"quantity "+quantity.toString());

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
  }
}