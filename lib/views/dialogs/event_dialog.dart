import 'package:flutter/material.dart';
import 'package:shared_cal/model/event.dart';

class EventDialog extends StatelessWidget {
  const EventDialog({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      title: Text(event.summary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        if (event.description != null)
          Text(event.description!.replaceAll("\\n", "\n")),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade600,
                foregroundColor: Colors.white,
              ),
              child: Text('Close'),
            ),
          ],
        ),
      ],
    );
  }
}
