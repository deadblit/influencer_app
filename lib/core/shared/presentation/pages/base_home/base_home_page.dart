import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../features/auth/data/repositories/auth_repository_interface.dart';

import 'home_navigation_bar.dart';

abstract class BaseHomePage extends StatelessWidget {
  final int navigationIndex;

  const BaseHomePage({
    super.key,
    required this.navigationIndex,
  });

  Widget buildPageContent(BuildContext context);

  FloatingActionButton buildActionButton(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aloha Influencer'),
        elevation: 2,
        actions: [
          PopupMenuButton(itemBuilder: (context) {
            return [
              const PopupMenuItem<int>(
                value: 0,
                child: Text("Meu perfil"),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text("Configurações"),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: Text("Sair"),
              ),
            ];
          }, onSelected: (value) async {
            if (value < 2) {
              messenger.showSnackBar(const SnackBar(
                content: Text("Não implementado"),
                duration: Duration(seconds: 3),
              ));
            }

            if (value == 2) {
              final authRepository = Modular.get<IAuthRepository>();
              final result = await authRepository.logout();
              switch (result) {
                case Success():
                  Modular.to
                      .pushNamedAndRemoveUntil('/auth/login', (_) => false);
                  break;

                case Error():
                  messenger.showSnackBar(SnackBar(
                    content: Text(result.error.toString()),
                    duration: const Duration(seconds: 5),
                  ));
              }
            }
          }),
        ],
      ),
      body: buildPageContent(context),
      floatingActionButton: buildActionButton(context),
      bottomNavigationBar: HomeNavigationBar(selectedIndex: navigationIndex),
    );
  }
}
