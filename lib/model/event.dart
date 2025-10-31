import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:intl/intl.dart';

enum EventDate { start, end }

class Event {
  static final _dateFormatter = DateFormat("HH:mm dd/MM/yy");

  final String? description;
  final String uid;
  final String summary;
  final DateTime? start;
  final DateTime? end;

  Event({
    required this.uid,
    required this.summary,
    this.description,
    this.start,
    this.end,
  });

  bool get hasDates => start != null && end != null;

  String? getFormattedDate(EventDate date) => switch (date) {
    EventDate.start => start == null ? null : _dateFormatter.format(start!),
    EventDate.end => end == null ? null : _dateFormatter.format(end!),
  };

  factory Event.fromJson(Map<String, dynamic> json) {
    final startDate = json['dtstart'] as IcsDateTime?;
    final endDate = json['dtend'] as IcsDateTime?;
    return Event(
      description: json['description'],
      uid: json['uid'],
      summary: json['summary'],
      start: startDate?.toDateTime(),
      end: endDate?.toDateTime(),
    );
  }
}
