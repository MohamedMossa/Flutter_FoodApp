import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_loader.dart';
import 'package:food_delivery_app/base/show_custome_snackbar.dart';
import 'package:food_delivery_app/controller/auth_controller.dart';
import 'package:food_delivery_app/moduls/signup_body_model.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widget/big_text.dart';
import 'package:get/get.dart';
import '../../widget/app_text_field_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController    = TextEditingController();
    final passwordController = TextEditingController();
    final nameController     = TextEditingController();
    final phoneController    = TextEditingController();
    List<String> signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
  void _registration(AuthController authController){
    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(name.isEmpty){
      showCustomSnackBar("Type in your name",title: "Name");
    }else if(phone.isEmpty){
      showCustomSnackBar("Type in your phone number",title: "phone");
    }else if(email.isEmpty){
      showCustomSnackBar("Type in your email",title: "Email address");
    }else if(email.isEmail){
      showCustomSnackBar("Type in a valid email address",title: "Valid email address");
    }else if (password.isEmpty){
      showCustomSnackBar("Type in your password",title: "password");
    }else if(password.length<6){
      showCustomSnackBar("Password can not be less than 6 characters",title: "Password");
    }
    else{
      SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password);
      authController.registration(signUpBody).then((status){
          if(status.isSuccess){
            print("succsess");
          }else{
            showCustomSnackBar(status.message);
          }
      });
    }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body:GetBuilder<AuthController>(builder: (_authController){
      return !_authController.isLoading? SingleChildScrollView(
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
              ///NameTextField
              AppTextField(
                textController: nameController,
                hintText: 'Name',
                icon: Icons.person,
              ),
              SizedBox(height: Dimensions.height20),
              ///phoneTextField
              AppTextField(
                textController: phoneController,
                hintText: 'Phone',
                icon: Icons.call,
              ),
              SizedBox(height: Dimensions.height20+Dimensions.height20),
              ///Sign up Button
              GestureDetector(
                onTap: (){
                  _registration(_authController);


                },
                child: Container(
                  width: Dimensions.screenWidth/2,
                  height:Dimensions.screenHeight/15 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: "Sign Up",color: Colors.white,size: Dimensions.font20+ Dimensions.font20/2,),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10),
              RichText(

                text:  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap= ()=>Get.back(),
                    text:"Have an account already?",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: Dimensions.font20
                    )
                ),
              ),
              SizedBox(height: Dimensions.screenHeight*0.05),
              ///Sign up options
              RichText(
                text:  TextSpan(
                  recognizer: TapGestureRecognizer()..onTap= ()=>Get.back(),
                  text:"Sign up using one of the following methods",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16
                  ),
                ),
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: Dimensions.radius30-5,
                    backgroundImage: AssetImage("assets/image/"+signUpImages[index]),
                  ),
                )),
              )
            ],
          ),
        ):CustomLoader();
      },)
    );
  }
}

