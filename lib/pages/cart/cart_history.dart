import 'package:flutter/material.dart';
import 'package:food_delivery_app/widget/big_text.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BigText(text: "CartHistory"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
