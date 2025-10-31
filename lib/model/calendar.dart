import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:shared_cal/model/event.dart';

class Calendar {
  final String version;
  final String prodId;
  final String? method;
  final List<Event> events;

  Calendar({
    required this.version,
    required this.prodId,
    this.method,
    this.events = const [],
  });

  factory Calendar.fromICal(ICalendar cal) {
    return Calendar(
      version: cal.version,
      prodId: cal.prodid,
      method: cal.method,
      events: cal.data
          .where((e) => e['type'] == 'VEVENT')
          .map(Event.fromJson)
          .toList()
          .reversed
          .toList(),
    );
  }
}
