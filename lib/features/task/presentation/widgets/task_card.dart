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
      color: done
          ? Theme.of(context).colorScheme.surface
          : Theme.of(context).colorScheme.surfaceVariant,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox.adaptive(
                  value: done,
                  onChanged: null,
                  fillColor: MaterialStatePropertyAll(
                    done
                        ? Theme.of(context).colorScheme.inversePrimary
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: done
                                  ? Theme.of(context).colorScheme.inversePrimary
                                  : Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        description ?? '(sem descrição)',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: done
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant
                                  : Theme.of(context).colorScheme.onSurface,
                            ),
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
