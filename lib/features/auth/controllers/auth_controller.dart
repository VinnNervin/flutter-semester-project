import 'package:first_app/features/auth/models/user_model.dart';
import 'package:first_app/features/auth/services/auth_services.dart';

class AuthController {
  final AuthServices _authService = AuthServices();

  bool isLoading = false;
  UserModel? user;

  Future<bool> login(String email, String password) async {
    isLoading = true;

    final result = await _authService.login(
      email.trim().toLowerCase(),
      password,
    );

    isLoading = false;

    if (result != null) {
      user = result;
      return true;
    }

    return false;
  }

  Future<bool> signUp(
    String email,
    String password,
    String confirmPassword,
  ) async {
    isLoading = true;

    final result = await _authService.signUp(
      email.trim().toLowerCase(),
      password,
      confirmPassword,
    );

    isLoading = false;

    if (result != null) {
      user = result;
      return true;
    }

    return false;
  }
}
