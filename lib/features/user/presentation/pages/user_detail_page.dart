import 'package:flutter/material.dart';

class UserDetailPage extends StatefulWidget {
  final String title;
  const UserDetailPage({Key? key, this.title = 'CampaignDetailPage'})
      : super(key: key);
  @override
  UserDetailPageState createState() => UserDetailPageState();
}

class UserDetailPageState extends State<UserDetailPage> {
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
