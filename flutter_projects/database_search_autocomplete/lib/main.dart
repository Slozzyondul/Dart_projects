import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:charcode/ascii.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dropFiles();
  runApp(App());
}

/// Example use-case only!
Future<void> dropFiles() async {
  final dir = await path_provider.getApplicationSupportDirectory();
  final assetsDir = Directory(path.join(dir.path, 'assets'));
  await assetsDir.create(recursive: true);
  final data = await rootBundle.load('assets/meetups.jsonl');
  await File(path.join(assetsDir.path, 'meetups.jsonl')) //
      .writeAsBytes(data.buffer.asUint8List());
  final index = await rootBundle.load('assets/meetups_index.json');
  await File(path.join(assetsDir.path, 'meetups_index.json')) //
      .writeAsBytes(index.buffer.asUint8List());
}

class MeetupsDatabase {
  MeetupsDatabase._(this._dataDir);

  final Directory _dataDir;
  late final dataFile = File(
    path.join(_dataDir.path, 'assets', 'meetups.jsonl'),
  );
  late final indexFile = File(
    path.join(_dataDir.path, 'assets', 'meetups_index.json'),
  );

  late Map<String, MeetupEntryIndex> _nameIndex;

  static Future<MeetupsDatabase> create() async {
    final dir = await path_provider.getApplicationSupportDirectory();
    final instance = MeetupsDatabase._(dir);
    // final indexData = await instance.buildIndex();
    // final index = json.encode(indexData);
    // print(index);
    await instance.load();
    return instance;
  }

  Future<Map<String, MeetupEntryIndex>> buildIndex() async {
    final data = await dataFile.readAsBytes();
    final index = SplayTreeMap<String, MeetupEntryIndex>();
    int start = 0;
    for (int i = 0; i < data.length; i++) {
      if (data[i] == $lf) {
        final line = utf8.decode(data.sublist(start, i));
        final entry = MeetupsEntry.fromJson(json.decode(line));
        index[entry.name.toLowerCase()] = MeetupEntryIndex(start, i);
        start = i + 1;
      }
    }
    return index;
  }

  Future<void> load() async {
    _nameIndex = (json.decode(await indexFile.readAsString()) as Map)
        .cast<String, dynamic>()
        .map(
          (key, value) => MapEntry(key, MeetupEntryIndex.fromJson(value)),
        );
  }

  Future<MeetupsEntry> entry(MeetupEntryIndex index) async {
    // TODO(slightfoot): Attempt to read from LruCache before loading from disk

    // final access = await dataFile.open()..setPosition(index.start);
    // final data = utf8.decode(await access.read(index.end - index.start));
    // await access.close();
    final data = await Utf8Decoder() //
        .bind(dataFile.openRead(index.start, index.end))
        .first;

    final entry = MeetupsEntry.fromJson(json.decode(data));

    // TODO(slightfoot): Add entry to LruCache

    return entry;
  }

  Stream<MeetupsEntry> search(String prefix) async* {
    final query = prefix.toLowerCase();
    final keys = _nameIndex.keys.toList();
    final startIndex = keys.indexWhere((el) => el.startsWith(query));
    if (startIndex == -1) {
      return;
    }
    final endIndex = keys.lastIndexWhere((el) => el.startsWith(query));
    if (endIndex == -1) {
      return;
    }
    for (int i = startIndex; i < endIndex; i++) {
      yield await entry(_nameIndex[keys[i]]!);
    }
  }
}

class MeetupEntryIndex {
  const MeetupEntryIndex(this.start, this.end);

  final int start;
  final int end;

  static MeetupEntryIndex fromJson(dynamic json) {
    return MeetupEntryIndex(json[0] as int, json[1] as int);
  }

  dynamic toJson() => [start, end];

  @override
  String toString() => 'MeetupEntryIndex{${json.encode(toJson())}}';
}

class MeetupsEntry {
  const MeetupsEntry({
    required this.link,
    required this.name,
    required this.location,
  });

  final String link;
  final String name;
  final String location;

  static MeetupsEntry fromJson(Map<String, dynamic> json) {
    return MeetupsEntry(
      link: json['link'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Future<MeetupsDatabase> _dbFuture;

  @override
  void initState() {
    super.initState();
    _dbFuture = MeetupsDatabase.create();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dbFuture,
      builder: (BuildContext context, AsyncSnapshot<MeetupsDatabase> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Home(
            database: snapshot.requireData,
          ),
        );
      },
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
    required this.database,
  });

  final MeetupsDatabase database;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchAnchor(
                builder: (BuildContext context, SearchController controller) {
                  return SearchBar(
                    controller: controller,
                    onTap: () => controller.openView(),
                    onChanged: (_) => controller.openView(),
                  );
                },
                suggestionsBuilder:
                    (BuildContext context, SearchController controller) async {
                  return [
                    await for (final entry
                        in database.search(controller.text)) //
                      MeetupListItem(entry: entry),
                  ];
                },
              ),
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: database.entries.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       final entry = database.entries[index];
          //       return MeetupListItem(
          //         onPressed: () => print('Open ${entry.link}'),
          //         entry: entry,
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MeetupListItem extends StatelessWidget {
  const MeetupListItem({
    super.key,
    this.onPressed,
    required this.entry,
  });

  final VoidCallback? onPressed;
  final MeetupsEntry entry;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(entry.name),
      subtitle: Text(entry.location),
    );
  }
}