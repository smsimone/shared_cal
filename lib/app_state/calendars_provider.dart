import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_cal/model/calendar_config.dart';

part 'calendars_provider.g.dart';

@riverpod
class Calendars extends _$Calendars {
  final _calendars = <CalendarConfig>[];

  @override
  List<CalendarConfig> build(WidgetRef ref) {
    return _calendars;
  }

  void addConfiguration({required String name, required String url}) {
    state.add(
      CalendarConfig(url: url, hexColor: Colors.red.toString(), name: name),
    );
  }
}
