import 'package:flutter_modular/flutter_modular.dart';

import 'package:influencer_app/core/core_module.dart';

import 'presentation/pages/campaign_detail_page.dart';
import 'presentation/pages/campaign_list_page.dart';

class CampaignModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const CampaignListPage(),
      transition: TransitionType.noTransition,
    );
    r.child('/:id', child: (context) => const CampaignDetailPage());
  }
}
