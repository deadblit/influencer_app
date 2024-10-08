import 'package:flutter/material.dart';

import '../../domain/entities/task_state.dart';
import 'widgets.dart';

class TaskStateBottomSheet extends StatefulWidget {
  TaskStateBottomSheet({
    super.key,
    required this.selectedItemIndex,
    required this.onSelectedItemIndex,
  })  : items = TaskState.values.map((e) => e.description).toList(),
        defaultLabel = '';

  TaskStateBottomSheet.withNull({
    super.key,
    int? selectedItemIndex,
    required this.onSelectedItemIndex,
  })  : items = TaskState.values.map((e) => e.description).toList()
          ..add('Qualquer estado'),
        selectedItemIndex = selectedItemIndex ?? TaskState.values.length,
        defaultLabel = '-';

  final List<String> items;
  final int selectedItemIndex;
  final Function(int? index) onSelectedItemIndex;
  final String defaultLabel;

  @override
  State<TaskStateBottomSheet> createState() => _TaskStateBottomSheetState();
}

class _TaskStateBottomSheetState extends State<TaskStateBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetMenu(
      items: widget.items,
      selectedItemIndex: widget.selectedItemIndex,
      onSelectedItemIndex: (index) {
        int? taskStateIndex = TaskState.values.elementAtOrNull(index)?.index;

        widget.onSelectedItemIndex(taskStateIndex);
      },
      defaultLabel: widget.defaultLabel,
      decoration: const InputDecoration(
        labelText: 'Status',
        hintText: 'Selecione o status da tarefa',
      ),
    );
  }
}
