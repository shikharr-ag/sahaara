import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahaara/auth/presentation/notifiers/my_user_notifier.dart';
import 'package:sahaara/global/sahaara_theme.dart';

class CheckboxList extends ConsumerStatefulWidget {
  final List<String> items; // List of items to display

  const CheckboxList({Key? key, required this.items}) : super(key: key);

  @override
  _CheckboxListState createState() => _CheckboxListState();
}

class _CheckboxListState extends ConsumerState<CheckboxList> {
  // List to keep track of the checked status of each item
  late List<bool> _checkedItems;

  @override
  void initState() {
    super.initState();
    // Initialize the checked items list with 'false' for each item
    _checkedItems = List<bool>.filled(widget.items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        return CheckboxListTile(
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          selectedTileColor: AppColors.surface,
          checkColor: AppColors.accentDark,
          fillColor: WidgetStatePropertyAll(_checkedItems[index]
              ? AppColors.accentLight
              : AppColors.background),
          title: Text(widget.items[index]),
          value: _checkedItems[index],
          onChanged: (bool? value) {
            setState(() {
              _checkedItems[index] = value ?? false; // Update checked status
            });
            List<String> r = [];
            for (bool b in _checkedItems) {
              if (b) {
                r.add(widget.items[_checkedItems.indexOf(b)]);
              }
            }
            ref.read(myUserNotifier.notifier).updateReasons(r);
          },
          controlAffinity:
              ListTileControlAffinity.leading, // Align checkbox to the leading
        );
      },
    );
  }
}
