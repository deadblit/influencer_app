import 'package:flutter/material.dart';

import 'package:influencer_app/core/shared/presentation/pages/base_home/base_home_page.dart';
import 'package:influencer_app/core/shared/presentation/pages/base_home/home_navigation_bar.dart';

class CampaignListPage extends BaseHomePage {
  const CampaignListPage({
    super.key,
    super.navigationIndex = HomeNavigationBar.destinationCampaigns,
  });

  Future<void> _loadData() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  @override
  Widget buildPageContent(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _loadData,
      // Render the todos
      child: const Center(
        child: Text('Campanhas'),
      ),
    );
  }

  @override
  FloatingActionButton buildActionButton(BuildContext context) {
    return const FloatingActionButton.large(
      onPressed: null,
      child: Icon(Icons.post_add),
    );
  }
}
