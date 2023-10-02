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

  void reload();

  bool canFilter() {
    return true;
  }

  void filter() {}

  bool isFiltered() {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: buildPageContent(context),
      floatingActionButton: buildActionButton(context),
      bottomNavigationBar: HomeNavigationBar(selectedIndex: navigationIndex),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return AppBar(
      title: const Text('Aloha Influencer'),
      elevation: 2,
      actions: [
        if (canFilter()) ...[
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  filter();
                },
                icon: const Icon(Icons.filter_list),
              ),
              if (isFiltered()) ...[
                Icon(
                  Icons.circle,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  size: 16,
                )
              ],
            ],
          ),
        ],
        IconButton(
          onPressed: () {
            reload();
          },
          icon: const Icon(Icons.replay_outlined),
        ),
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
                Modular.to.pushNamedAndRemoveUntil('/auth/login', (_) => false);
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
    );
  }
}
