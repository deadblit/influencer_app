import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String? description;
  final bool done;
  final Function()? onTap;

  const TaskCard({
    super.key,
    required this.title,
    this.description,
    required this.done,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: InkWell(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 16, 16),
          child: SizedBox(
            height: 60,
            child: Row(
              children: [
                Checkbox.adaptive(
                  value: done,
                  onChanged: null,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        description ?? '(sem descrição)',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
