import 'package:flutter/material.dart';

class BottomSheetMenu extends StatelessWidget {
  final InputDecoration decoration;
  final String defaultLabel;
  final List<String> items;
  final int selectedItemIndex;
  final Function(int index)? onSelectedItemIndex;

  const BottomSheetMenu({
    super.key,
    this.decoration = const InputDecoration(),
    this.defaultLabel = '',
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
            Text(selectedItemIndex == -1
                ? defaultLabel
                : items[selectedItemIndex]),
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
