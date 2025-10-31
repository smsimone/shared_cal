import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:icalendar_parser/icalendar_parser.dart';
import 'package:shared_cal/components/event_row.dart';
import 'package:shared_cal/model/calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _calendarJsonData = ValueNotifier<Calendar?>(null);
  ICalendar? _cal;

  Future<File?> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: "Pick .ics file",
      allowMultiple: false,
      allowedExtensions: ["ics"],
      type: FileType.custom,
    );
    if (result == null) return null;
    return File(result.files.single.path!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedCal"),
        actions: [
          ValueListenableBuilder(
            valueListenable: _calendarJsonData,
            builder: (context, val, _) {
              if (val == null) return Container();

              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: OutlinedButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Text(
                                JsonEncoder.withIndent(" ").convert(_cal!),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  child: Text("show raw"),
                ),
              );
            },
          ),
          ElevatedButton(
            onPressed: () async {
              final file = await _pickFile();
              if (file == null) return;
              final lines = file.readAsLinesSync();
              if (lines.isEmpty) return;
              _cal = ICalendar.fromLines(lines);
              _calendarJsonData.value = Calendar.fromICal(_cal!);
            },
            child: Text("upload ics"),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: ValueListenableBuilder(
          valueListenable: _calendarJsonData,
          builder: (context, data, child) {
            if (data == null) return Center(child: Text("Upload calendar"));
            return ListView(
              children: data.events.map((ev) => EventRow(event: ev)).toList(),
            );
          },
        ),
      ),
    );
  }
}
