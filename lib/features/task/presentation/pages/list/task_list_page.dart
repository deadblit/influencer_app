import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/shared/presentation/pages/base_home/base_home_page.dart';
import '../../../../../core/shared/presentation/pages/base_home/home_navigation_bar.dart';
import '../../../domain/entities/task_state.dart';
import '../../widgets/task_card.dart';

import 'task_list_store.dart';

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
        Modular.to.pushNamed('/tasks/new');
      },
    );
  }

  @override
  void reload() {
    _store.getAll();
  }

  Widget _buildItem(BuildContext context, int index) {
    final task = _store.taskList[index];
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: const ColoredBox(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.delete, color: Colors.white),
          ),
        ),
      ),
      confirmDismiss: (DismissDirection direction) async {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Deseja apagar a tarefa?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Não'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Sim'),
                )
              ],
            );
          },
        );
        return confirmed;
      },
      onDismissed: (DismissDirection direction) {
        _store.delete(task);
      },
      child: TaskCard(
        done: task.state == TaskState.done,
        title: task.title,
        description: task.description,
        onTap: () {
          Modular.to.pushNamed('/tasks/${task.id}');
        },
      ),
    );
  }
}
