import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex=0;
  List pages = [
    MainFoodPage(),
    Center(child: Text("page"),),
    Center(child: Text("Next page"),),
    Center(child: Text("Next Next page"),),
  ];

  void onTapNav(int index){
    setState(() {
      selectedIndex =index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],


      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.iconColor1,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
        onTap: onTapNav,
        items: [
          BottomNavigationBarItem(icon:Icon(Icons.home_outlined),label: "Home"),
          BottomNavigationBarItem(icon:Icon(Icons.archive),label: "History"),
          BottomNavigationBarItem(icon:Icon(Icons.shopping_cart),label: "cart"),
          BottomNavigationBarItem(icon:Icon(Icons.person),label: "me"),

        ],
      ),
    );
  }
}
