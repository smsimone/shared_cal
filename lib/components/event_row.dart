import 'package:flutter/material.dart';
import 'package:shared_cal/model/event.dart';
import 'package:shared_cal/views/dialogs/event_dialog.dart';

class EventRow extends StatelessWidget {
  const EventRow({super.key, required this.event});

  final Event event;

  Widget? _buildSubtitle() {
    return Text.rich(
      TextSpan(
        children: [
          if (event.start != null) ...[
            TextSpan(text: 'From: '),
            TextSpan(text: event.getFormattedDate(EventDate.start)),
          ],
          if (event.end != null) ...[
            TextSpan(text: ' To: '),
            TextSpan(text: event.getFormattedDate(EventDate.end)),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(event.summary),
        subtitle: _buildSubtitle(),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => EventDialog(event: event),
          );
        },
      ),
    );
  }
}
