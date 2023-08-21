import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/pages/campaign_detail_page.dart';
import 'presentation/pages/campaign_list_page.dart';

class CampaignModule extends Module {
  @override
  void binds(Injector i) {
    // TODO: implement binds
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const CampaignListPage());
    r.child('/:id', child: (context) => const CampaignDetailPage());
  }
}
