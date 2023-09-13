import 'package:flutter/material.dart';

class CategoryPopupMenu extends StatefulWidget {
  final VoidCallback onEditSelected;
  final VoidCallback onDeleteSelected;

  const CategoryPopupMenu({
    super.key,
    required this.onEditSelected,
    required this.onDeleteSelected,
  });

  @override
  // ignore: library_private_types_in_public_api
  State<CategoryPopupMenu> createState() => _CategoryPopupMenuState();
}

class _CategoryPopupMenuState extends State<CategoryPopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      color: Colors.white,
      onSelected: (choice) {
        if (choice == 'edit') {
          widget.onEditSelected();
        } else if (choice == 'delete') {
          widget.onDeleteSelected();
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
    );
  }
}
