import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'login_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _store = Modular.get<LoginStore>();
  final _formKey = GlobalKey<FormState>();
  final _userTextEditController = TextEditingController();
  final _passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        return reaction(
          (_) => _store.errorMessage,
          (value) {
            if (value == null) {
              return;
            }

            final messenger = ScaffoldMessenger.of(context);
            messenger.showSnackBar(SnackBar(
              content: Text(value),
              duration: const Duration(seconds: 5),
            ));
          },
        );
      },
      child: Observer(
        builder: (context) => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            controller: _userTextEditController,
                            decoration: const InputDecoration(
                              labelText: 'Usuário',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite seu usuário';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            obscureText: true,
                            controller: _passwordTextEditController,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite sua senha';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _store.login(_userTextEditController.text,
                              _passwordTextEditController.text);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
