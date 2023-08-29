import 'package:shopping_app/core/utils/api_service.dart';
import 'package:shopping_app/features/auth/data/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:shopping_app/features/auth/data/models/sign_in_model/sign_in_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_out_model/sign_out_model.dart';
import 'package:shopping_app/features/auth/data/models/sign_up_model/sign_up_model.dart';
import 'package:shopping_app/features/auth/data/models/user_model/user_response_model.dart';
import 'package:shopping_app/core/utils/end_points.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserResponseModel> signUp(SignUpModel signUpModel) async {
    Map<String, dynamic> response = await apiService.post(
      endPoint: EndPoints.signUp,
      data: {
        'name': signUpModel.name,
        'phone': signUpModel.phone,
        'email': signUpModel.email,
        'password': signUpModel.password,
      },
    );
    UserResponseModel userResponseModel = UserResponseModel.fromJson(response);
    return userResponseModel;
  }

  @override
  Future<UserResponseModel> signIn(SignInModel signInModel) async{
    Map<String, dynamic> response = await apiService.post(
      endPoint: EndPoints.signIn,
      data: {
        'email': signInModel.email,
        'password': signInModel.password,
      },
    );
    UserResponseModel userResponseModel = UserResponseModel.fromJson(response);
    return userResponseModel;
  }

  @override
  Future<SignOutModel> signOut(String token) async{
    Map<String, dynamic> response = await apiService.post(
      endPoint: EndPoints.signOut,
      data: {
        'fcm_token': token,
      },
    );
    SignOutModel signOutModel = SignOutModel.fromJson(response);
    return signOutModel;
  }
}
