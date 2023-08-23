import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../data/repositories/auth_repository_interface.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final IAuthRepository repository;

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @observable
  String? errorMessage;

  LoginStoreBase(this.repository);

  @action
  Future<void> login(String username, String password) async {
    isLoading = true;
    final result = await repository.login(username, password);
    isLoading = false;

    switch (result) {
      case Success():
        if (result.success) {
          isLoggedIn = true;
          errorMessage = null;
          Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
        } else {
          isLoggedIn = false;
          errorMessage = "Nome de usuário ou senha incorretos";
        }

        break;

      case Error():
        isLoggedIn = false;
        errorMessage = result.error.toString();
    }
  }

  @action
  void clearError() {
    errorMessage = null;
  }
}
