import 'dart:convert';

import 'package:database_search_autocomplete/models/meetup_entry.dart';
import 'package:flutter/services.dart' show rootBundle;


class MeetupsDatabase {
  MeetupsDatabase._();

  late List<MeetupsEntry> entries;

  static Future<MeetupsDatabase> create() async {
    final instance = MeetupsDatabase._();
    await instance.load();
    return instance;
  }

  Future<void> load() async {
    final data = await rootBundle.loadString('assets/meetups.jsonl');
    final lines = const LineSplitter().convert(data);
    final entries = <MeetupsEntry>[];
    for (final line in lines) {
      final map = json.decode(line);
      entries.add(MeetupsEntry.fromJson(map));
    }
    this.entries = entries;
  }
}