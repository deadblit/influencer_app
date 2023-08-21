import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;

  const TaskCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text(title)),
        ),
      ),
    );
  }
}
