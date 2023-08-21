import 'package:flutter/material.dart';

class CampaignListPage extends StatefulWidget {
  final String title;
  const CampaignListPage({Key? key, this.title = 'Campanhas'})
      : super(key: key);
  @override
  CampaignListPageState createState() => CampaignListPageState();
}

class CampaignListPageState extends State<CampaignListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Column(
        children: <Widget>[],
      ),
    );
  }
}
