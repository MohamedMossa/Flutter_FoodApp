import 'package:food_delivery_app/data/repository/auth_repo.dart';
import 'package:food_delivery_app/moduls/response_model.dart';
import 'package:food_delivery_app/moduls/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{

  final AuthRepo authRepo;

  AuthController({required this.authRepo});


  bool _isLoading = false;
  bool get isLoading => _isLoading;

Future<ResponseModel> registration(SignUpBody signUpBody)async{
    _isLoading =true;
    update();
     Response response = await authRepo.registration(signUpBody);
     late ResponseModel responseModel;
     if (response.statusCode ==200){
      authRepo.savaUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);

     }else{
       responseModel = ResponseModel(false, response.statusText!);
     }
     _isLoading = false;
     update();
     return responseModel;
  }

}