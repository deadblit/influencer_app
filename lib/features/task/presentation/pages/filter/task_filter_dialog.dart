import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../widgets/widgets.dart';
import 'task_filter_store.dart';

class TaskFilterDialog extends StatefulWidget {
  const TaskFilterDialog({Key? key}) : super(key: key);

  @override
  TaskFilterDialogState createState() => TaskFilterDialogState();
}

class TaskFilterDialogState extends State<TaskFilterDialog> {
  final _store = Modular.get<TaskFilterStore>();
  final List<ReactionDisposer> _disposers = [];

  @override
  void initState() {
    super.initState();

    _disposers.addAll([
      reaction(
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
      ),
      reaction(
        (_) => _store.shouldCloseDialog,
        (value) {
          if (value) {
            Modular.to.pop();
          }
        },
      ),
      reaction(
        (_) => _store.isFilterLoaded,
        (value) {
          if (value) {}
        },
      ),
    ]);
  }

  @override
  void dispose() {
    for (final d in _disposers) {
      d();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtro'),
      ),
      body: Column(
        children: [
          Observer(
            builder: (_) {
              if (_store.isLoading) {
                return const LinearProgressIndicator();
              } else {
                return Container();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) => BottomSheetMenu(
                    items: _store.userList.map((e) => e.username).toList(),
                    selectedItemIndex: _store.ownerUserIndex,
                    onSelectedItemIndex: (index) {
                      _store.ownerUserIndex = index;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Criador',
                      hintText: 'Selecione o criador da tarefa',
                      errorText: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Observer(
                    builder: (_) => TaskStateBottomSheet.withNull(
                      selectedItemIndex: _store.taskStatusIndex,
                      onSelectedItemIndex: _store.updateTaskStatusIndex,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: _store.saveFilters,
                    child: const Text('Salvar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: _store.clearFilters,
                    child: const Text('Limpar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
