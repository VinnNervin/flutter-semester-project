import 'package:first_app/features/auth/models/user_model.dart';

class AuthServices {
  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == "admin@gmail.com" && password == '123') {
      return UserModel(id: 1, name: 'Admin', email: email);
    }
    return null;
  }

  Future<UserModel?> signUp(
    String email,
    String password,
    String confirmPassword,
  ) async {
    await Future.delayed(const Duration(seconds: 1));

    if (password != confirmPassword) {
      return null;
    }

    if (email == "admin@gmail.com") {
      return null;
    }

    return UserModel(id: 2, name: 'user', email: email);
  }
}
