import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:influencer_app/features/task/presentation/widgets/widgets.dart';
import 'package:mobx/mobx.dart';

import 'task_detail_store.dart';

class TaskDetailPage extends StatefulWidget {
  final String taskId;

  bool get isNewTask => taskId == 'new';
  String get title => isNewTask ? 'Nova tarefa' : 'Editar tarefa';

  const TaskDetailPage({Key? key, required this.taskId}) : super(key: key);

  @override
  TaskDetailPageState createState() => TaskDetailPageState();
}

class TaskDetailPageState extends State<TaskDetailPage> {
  final _store = Modular.get<TaskDetailStore>();
  final List<ReactionDisposer> _disposers = [];
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _descriptionController = TextEditingController();

    _store.setupValidations();

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
        (_) => _store.shouldClosePage,
        (value) {
          if (value) {
            Modular.to.pop();
          }
        },
      ),
      reaction(
        (_) => _store.isTaskLoaded,
        (value) {
          if (value) {
            _titleController.text = _store.title ?? '';
            _descriptionController.text = _store.description ?? '';
          }
        },
      ),
    ]);

    if (!widget.isNewTask) {
      _store.taskId = widget.taskId;
      _store.loadTask();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    for (final d in _disposers) {
      d();
    }

    _store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _titleController,
                    onChanged: (value) => _store.title = value,
                    decoration: InputDecoration(
                      labelText: 'Título',
                      hintText: 'Digite o título da tarefa',
                      errorText: _store.error.title,
                    ),
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    onChanged: (value) => _store.description = value,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      hintText: 'Digite a descrição da tarefa',
                    ),
                  ),
                  Observer(
                    builder: (_) => BottomSheetMenu(
                      items: _store.userList.map((e) => e.username).toList(),
                      selectedItemIndex: _store.ownerIndex,
                      onSelectedItemIndex: (index) {
                        _store.ownerIndex = index;
                      },
                      decoration: InputDecoration(
                        labelText: 'Criador',
                        hintText: 'Selecione o criador da tarefa',
                        errorText: _store.error.owner,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => BottomSheetMenu(
                      items: _store.userList.map((e) => e.username).toList(),
                      selectedItemIndex: _store.assigneeIndex,
                      onSelectedItemIndex: (index) =>
                          _store.assigneeIndex = index,
                      decoration: InputDecoration(
                        labelText: 'Responsável',
                        hintText:
                            'Selecione o responsável pela execução da tarefa',
                        errorText: _store.error.assignee,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => BottomSheetMenu(
                      items: _store.userList.map((e) => e.username).toList(),
                      selectedItemIndex: _store.relatedIndex,
                      onSelectedItemIndex: (index) =>
                          _store.relatedIndex = index,
                      decoration: const InputDecoration(
                        labelText: 'Relacionado',
                        hintText: 'Selecione alguém relacionado a essa tarefa',
                      ),
                    ),
                  ),
                  if (!widget.isNewTask)
                    Observer(
                      builder: (_) => TaskStateBottomSheet(
                        selectedItemIndex: _store.statusIndex,
                        onSelectedItemIndex: _store.updateTaskStatusIndex,
                      ),
                    ),
                  Observer(
                    builder: (_) => TaskProgressSlider(
                        currentSliderValue: _store.progress.toDouble(),
                        onChanged: _store.onUpdateSliderProgress),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: _store.validateAll,
                      child: const Text('Salvar'),
                    ),
                  ),
                ],
              ),
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
