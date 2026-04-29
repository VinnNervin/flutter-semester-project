import 'package:first_app/features/auth/models/signin_request_model.dart';
import 'package:first_app/features/auth/models/signup_request_model.dart';
import 'package:first_app/features/auth/models/user_model.dart';
import 'package:first_app/features/auth/services/auth_services.dart';

class AuthController {
  final AuthServices _authService = AuthServices();

  bool isLoading = false;
  UserModel? user;

  Future<bool> login(String email, String password) async {
    isLoading = true;

    print({email, password});
    final result = await _authService.login(
      SigninRequestModel(email: email, password: password),
    );

    isLoading = false;

    if (result != null) {
      user = result;
      return true;
    }

    return false;
  }

  Future<bool> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    isLoading = true;

    final result = await _authService.signUp(
      SignupRequestModel(
        name: name,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
      ),
    );

    isLoading = false;

    if (result != null) {
      user = result;
      return true;
    }

    return false;
  }
}
