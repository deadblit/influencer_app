import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'package:influencer_app/features/task/domain/entities/task_state.dart';
import 'package:influencer_app/features/task/presentation/pages/task_list_store.dart';

import '../../../../core/shared/presentation/pages/base_home/base_home_page.dart';
import '../../../../core/shared/presentation/pages/base_home/home_navigation_bar.dart';
import '../widgets/task_card.dart';

class TaskListPage extends BaseHomePage {
  final _store = Modular.get<TaskListStore>();

  TaskListPage({
    super.key,
    super.navigationIndex = HomeNavigationBar.destinationTasks,
  }) {
    _store.getAll();
  }

  @override
  Widget buildPageContent(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        return reaction(
          (_) => _store.errorMessage,
          (value) {
            if (value == null) {
              return;
            }

            final messenger = ScaffoldMessenger.of(context);
            messenger.showSnackBar(SnackBar(
              content: Text(value),
              duration: const Duration(seconds: 4),
            ));
          },
        );
      },
      child: Observer(
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (_store.isLoading) ...[
              const LinearProgressIndicator(),
            ],
            Expanded(
              child: RefreshIndicator(
                onRefresh: _store.getAll,
                child: ListView.builder(
                  itemCount: _store.taskList.length,
                  itemBuilder: (context, index) => _buildItem(context, index),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  FloatingActionButton buildActionButton(BuildContext context) {
    return FloatingActionButton.large(
      child: const Icon(Icons.add_task),
      onPressed: () {
        Modular.to.pushNamed('/tasks/0');
      },
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final task = _store.taskList[index];
    return TaskCard(
      done: task.state == TaskState.done,
      title: task.title,
      description: task.description,
    );
  }
}
