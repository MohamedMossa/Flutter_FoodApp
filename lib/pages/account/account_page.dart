import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/account_widget.dart';
import 'package:food_delivery_app/widget/big_text.dart';

import '../../utils/colors.dart';
import '../../widget/app_icon.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: BigText(
          text: "Profile",
          size: 24,
          color: Colors.white,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: Dimensions.height20),
        width: double.maxFinite,
        child: Column(
          children: [
            AppIcon(
              icon: Icons.person,
              backgroundColor: AppColors.mainColor,
              iconColor: Colors.white,
              iconSize: Dimensions.height15 * 5,
              size: Dimensions.height15 * 8,
            ),
            SizedBox(height: Dimensions.height20),
         Expanded(
           child: SingleChildScrollView(
             child: Column(
               children: [
                 //user
                 AccountWidget(
                     appIcon: AppIcon(
                       icon: Icons.person,
                       backgroundColor: AppColors.mainColor,
                       iconColor: Colors.white,
                       iconSize: Dimensions.height10 * 5 / 2,
                       size: Dimensions.height10 * 5,
                     ),
                     bigText: BigText(
                       text: "Mohamed",
                     )),
                 SizedBox(height: Dimensions.height20),
                 // phone
                 AccountWidget(
                     appIcon: AppIcon(
                       icon: Icons.call,
                       backgroundColor: AppColors.yellowColor,
                       iconColor: Colors.white,
                       iconSize: Dimensions.height10 * 5 / 2,
                       size: Dimensions.height10 * 5,
                     ),
                     bigText: BigText(
                       text: "552368966",
                     )),
                 SizedBox(height: Dimensions.height20),
                 //E-Mail
                 AccountWidget(
                     appIcon: AppIcon(
                       icon: Icons.email,
                       backgroundColor: AppColors.yellowColor,
                       iconColor: Colors.white,
                       iconSize: Dimensions.height10 * 5 / 2,
                       size: Dimensions.height10 * 5,
                     ),
                     bigText: BigText(
                       text: "mohamed@email.com",
                     )),
                 SizedBox(height: Dimensions.height20),
                 //Address
                 AccountWidget(
                     appIcon: AppIcon(
                       icon: Icons.location_on_sharp,
                       backgroundColor: AppColors.yellowColor,
                       iconColor: Colors.white,
                       iconSize: Dimensions.height10 * 5 / 2,
                       size: Dimensions.height10 * 5,
                     ),
                     bigText: BigText(
                       text: "fill your address",
                     )),
                 SizedBox(height: Dimensions.height20),
                 //message
                 AccountWidget(
                     appIcon: AppIcon(
                       icon: Icons.message_outlined,
                       backgroundColor: Colors.redAccent,
                       iconColor: Colors.white,
                       iconSize: Dimensions.height10 * 5 / 2,
                       size: Dimensions.height10 * 5,
                     ),
                     bigText: BigText(
                       text: "Mohamed",
                     )),
                 SizedBox(height: Dimensions.height20),
               ],
             ),
           ),
         )
          ],
        ),
      ),
    );
  }
}
