import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview/models/user_model.dart';
import 'package:interview/repository/api_service.dart';

class Authentication extends StateNotifier<AsyncValue<UserModel>> {
  Authentication() : super(AsyncData(UserModel()));

  Future signInWithUserNameAndPassword(String email, String password) async {
    state = const AsyncLoading();
    try {
      final model = await ApiService.getUsers(email: email, password: password);
      state = AsyncData(model);
      return model;
    } catch (e) {
      state = AsyncError(e.toString());
    }
  }
}

final authenticationProvider =
    StateNotifierProvider<Authentication, AsyncValue<UserModel>>((ref) {
  return Authentication();
});
