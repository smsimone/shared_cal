import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddCalendarDialog extends StatefulWidget {
  const AddCalendarDialog({super.key});

  @override
  State<AddCalendarDialog> createState() => _AddCalendarDialogState();
}

class _AddCalendarDialogState extends State<AddCalendarDialog> {
  late ProviderContainer _provider;
  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _provider = ProviderScope.containerOf(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SimpleDialog(
        contentPadding: const EdgeInsets.all(10),
        title: Text("Add calendar"),
        children: [
          TextFormField(decoration: InputDecoration(labelText: "Url")),
          TextFormField(decoration: InputDecoration(labelText: "Name")),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text('Cancel'),
                ),
                const SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {
                    final state = _formKey.currentState!;
                    if (!state.validate()) return;
                    // _provider.read(calendarsProvider.notifier);
                  },
                  child: Text('Confirm'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
