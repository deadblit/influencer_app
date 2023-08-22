import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class HomeNavigationBar extends StatelessWidget {
  static const destinationTasks = 0;
  static const destinationCampaigns = 1;
  static const destinationTeam = 2;

  final int selectedIndex;

  const HomeNavigationBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      key: key,
      selectedIndex: selectedIndex,
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
      onDestinationSelected: _selectedDestination,
    );
  }

  void _selectedDestination(int index) {
    switch (index) {
      case HomeNavigationBar.destinationTasks:
        Modular.to.pushReplacementNamed('/tasks');
        break;

      case HomeNavigationBar.destinationCampaigns:
        Modular.to.pushReplacementNamed('/campaigns');
        break;

      case HomeNavigationBar.destinationTeam:
        Modular.to.pushReplacementNamed('/users');
        break;
    }
  }
}
