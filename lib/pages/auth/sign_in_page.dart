import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/auth/sign_up_page.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:get/get.dart';
import '../../widget/app_text_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    final phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(

          children: [
            SizedBox(height: Dimensions.screenHeight*0.05),
            ///App Logo
            Container(
              height:Dimensions.screenHeight*0.25 ,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 80,
                  backgroundImage: AssetImage("assets/image/logo part 1.png"),
                ),
              ),
            ),
            ///welcone
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimensions.width20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",
                  style: TextStyle(
                  fontSize: Dimensions.font20*3+Dimensions.font20/2,
                  fontWeight: FontWeight.bold),
                  ),
                  Text("Sign into your accont",
                    style: TextStyle(
                        fontSize: Dimensions.font20,
                      color: Colors.grey[500]
                     ),
                  )
                ],
              ),

            ),
            SizedBox(height: Dimensions.height20),

            ///EmailTextField
            AppTextField(
              textController: emailController,
              hintText: 'Email',
              icon: Icons.email,
            ),
            SizedBox(height: Dimensions.height20),
            ///PasswordTextField
            AppTextField(
              textController: passwordController,
              hintText: 'password',
              icon: Icons.password_sharp,
            ),
            SizedBox(height: Dimensions.height20),
            Row(
              children: [
                Expanded(child: SizedBox()),
                RichText(
                  text:  TextSpan(
                      text:"Sing into your account",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: Dimensions.font20
                      )
                  ),
                ),
                SizedBox(width: Dimensions.width20,)
              ],
            ),
            SizedBox(height: Dimensions.height20+Dimensions.height20),
            ///Sign up Button
            Container(
              width: Dimensions.screenWidth/2,
              height:Dimensions.screenHeight/15 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: "Sign in",color: Colors.white,size: Dimensions.font20+ Dimensions.font20/2,),
              ),
            ),
            SizedBox(height: Dimensions.height10),

            SizedBox(height: Dimensions.screenHeight*0.05),

            RichText(
              text:  TextSpan(
                recognizer: TapGestureRecognizer()..onTap= ()=>Get.back(),
                text:"Don\'t have an account? ",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font16
                ),
                children: [
                  TextSpan(
                  recognizer: TapGestureRecognizer()..onTap= ()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                text:"Create",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: AppColors.mainBlackColor,
                    fontSize: Dimensions.font16
                ),
                  ),
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}

