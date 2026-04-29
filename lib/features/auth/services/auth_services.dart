import 'dart:convert';

import 'package:first_app/features/auth/models/signin_request_model.dart';
import 'package:first_app/features/auth/models/signup_request_model.dart';
import 'package:first_app/features/auth/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthConstant {
  static final String _userKey = 'user_data';
}

class AuthServices {
  Future<UserModel?> login(SigninRequestModel userRequestPayload) async {
    // await Future.delayed(const Duration(seconds: 1));

    // if (email == "admin@gmail.com" && password == '123') {
    //   return UserModel(id: 1, name: 'Admin', email: email, password: password);
    // }
    // return null;

    final sharedStrorage = await SharedPreferences.getInstance();

    final storageData = sharedStrorage.getString(AuthConstant._userKey);

    if (storageData == null) {
      return null;
    }

    final user = UserModel.fromJson(jsonDecode(storageData));

    if (user.email == userRequestPayload.email &&
        user.password == userRequestPayload.password) {
      return user;
    }
    return null;
  }

  Future<UserModel?> signUp(SignupRequestModel userRequestPayload) async {
    if (userRequestPayload.password != userRequestPayload.confirmPassword ||
        userRequestPayload.email.isEmpty &&
            userRequestPayload.password.isEmpty &&
            userRequestPayload.name.isEmpty) {
      return null;
    }

    final sharedStrorage = await SharedPreferences.getInstance();

    final user = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: userRequestPayload.name,
      email: userRequestPayload.email,
      password: userRequestPayload.password,
    );

    await sharedStrorage.setString(
      AuthConstant._userKey,
      jsonEncode(user.toJson()),
    );

    return user;
  }
}
