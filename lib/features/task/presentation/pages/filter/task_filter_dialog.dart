import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

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
                      labelText: 'Relator',
                      hintText: 'Selecione o relator da tarefa',
                      errorText: null,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 8,
                  ),
                  child: Row(
                    children: [
                      Observer(
                        builder: (context) {
                          return Checkbox.adaptive(
                            value: _store.isDone,
                            onChanged: (value) =>
                                _store.isDone = value ?? false,
                          );
                        },
                      ),
                      const Text('Finalizada'),
                    ],
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

class BottomSheetMenu extends StatelessWidget {
  final InputDecoration decoration;
  final List<String> items;
  final int selectedItemIndex;
  final Function(int index)? onSelectedItemIndex;

  const BottomSheetMenu({
    super.key,
    this.decoration = const InputDecoration(),
    required this.items,
    this.selectedItemIndex = -1,
    this.onSelectedItemIndex,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: decoration,
      child: TextButton(
        onPressed: () => _showModalList(context),
        style: TextButton.styleFrom(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: const StadiumBorder(),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              selectedItemIndex == -1 ? '' : items[selectedItemIndex],
              // style: const TextStyle(color: Colors.black),
            ),
            const Icon(
              Icons.expand_more_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showModalList(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return Scrollbar(
          radius: const Radius.circular(25),
          thumbVisibility: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: items.map(
                (element) {
                  final index = items.indexOf(element);
                  return ListTile(
                    title: Text(element),
                    onTap: () {
                      if (onSelectedItemIndex != null) {
                        onSelectedItemIndex!(index);
                      }
                      Navigator.pop(context);
                    },
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}
