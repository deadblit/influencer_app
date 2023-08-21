import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  final String title;
  const UserListPage({Key? key, this.title = 'Pessoas'}) : super(key: key);
  @override
  UserListPageState createState() => UserListPageState();
}

class UserListPageState extends State<UserListPage> {
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
