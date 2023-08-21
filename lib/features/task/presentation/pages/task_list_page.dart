import 'package:flutter/material.dart';

import '../../../../core/shared/mock_data.dart';
import '../widgets/task_card.dart';

class TaskListPage extends StatelessWidget {
  final String title;

  const TaskListPage({Key? key, this.title = 'Tarefas'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => _buildItem(context, index),
        ));
  }

  Widget _buildItem(BuildContext context, int index) {
    return TaskCard(title: tasks[index].title);
  }
}
