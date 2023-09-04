import 'package:flutter/material.dart';

import '../../../../core/shared/presentation/pages/base_home/base_home_page.dart';
import '../../../../core/shared/presentation/pages/base_home/home_navigation_bar.dart';

class UserListPage extends BaseHomePage {
  const UserListPage({
    super.key,
    super.navigationIndex = HomeNavigationBar.destinationTeam,
  });

  Future<void> _loadData() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget buildPageContent(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadData,
      child: const Center(
        child: Text('Time'),
      ),
    );
  }

  @override
  FloatingActionButton buildActionButton(BuildContext context) {
    return const FloatingActionButton.large(
      onPressed: null,
      child: Icon(Icons.group_add),
    );
  }

  @override
  void reload() {}
}
