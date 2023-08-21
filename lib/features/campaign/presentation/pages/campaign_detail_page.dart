import 'package:flutter/material.dart';

class CampaignDetailPage extends StatefulWidget {
  final String title;
  const CampaignDetailPage({Key? key, this.title = 'CampaignDetailPage'})
      : super(key: key);
  @override
  CampaignDetailPageState createState() => CampaignDetailPageState();
}

class CampaignDetailPageState extends State<CampaignDetailPage> {
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
