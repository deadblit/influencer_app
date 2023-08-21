import 'package:flutter/material.dart';

class TaskDetailPage extends StatefulWidget {
  final String title;
  const TaskDetailPage({Key? key, this.title = 'TaskDetailPage'}) : super(key: key);
  @override
  TaskDetailPageState createState() => TaskDetailPageState();
}
class TaskDetailPageState extends State<TaskDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}