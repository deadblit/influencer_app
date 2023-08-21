import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:influencer_app/features/auth/data/repositories/auth_repository_interface.dart';
import 'package:influencer_app/features/user/presentation/pages/user_list_page.dart';

import '../../../campaign/presentation/pages/campaign_list_page.dart';
import '../../../task/presentation/pages/task_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final _taskListPage = const TaskListPage();
  final _campaignListPage = const CampaignListPage();
  final _userListPage = const UserListPage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final messenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Aloha Influencer'),
        elevation: 2,
        actions: [
          PopupMenuButton(
              // add icon, by default "3 dot" icon
              // icon: Icon(Icons.book)
              itemBuilder: (context) {
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
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _taskListPage,
          _campaignListPage,
          _userListPage,
        ],
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.task),
            label: 'Tarefas',
          ),
          NavigationDestination(
            icon: Icon(Icons.campaign),
            label: 'Campanhas',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'Equipe',
          ),
        ],
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
