import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/backend/supabase/supabase.dart';

class TutorialCache {
  static const _tutorialsKey = 'tutorials_cache_v1';

  static Future<List<TutoriaisRow>> loadTutorials() async {
    final cached = await getCachedTutorials();
    if (cached.isNotEmpty) {
      return cached;
    }
    return refreshTutorials();
  }

  static Future<List<TutoriaisRow>> getCachedTutorials() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_tutorialsKey);
    if (raw == null || raw.isEmpty) {
      return <TutoriaisRow>[];
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) {
        return <TutoriaisRow>[];
      }

      return decoded
          .whereType<Map>()
          .map((item) => Map<String, dynamic>.from(item))
          .map(TutoriaisRow.new)
          .toList();
    } catch (_) {
      return <TutoriaisRow>[];
    }
  }

  static Future<List<TutoriaisRow>> refreshTutorials() async {
    final rows = await TutoriaisTable().queryRows(
      queryFn: (q) => q.order('created_at', ascending: false),
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _tutorialsKey,
      jsonEncode(rows.map((row) => _encodeRow(row.data)).toList()),
    );

    return rows;
  }

  static TutoriaisRow? findByName(
    List<TutoriaisRow> tutorials,
    String tutorialName,
  ) {
    for (final tutorial in tutorials) {
      if ((tutorial.nome ?? '').trim() == tutorialName.trim()) {
        return tutorial;
      }
    }
    return null;
  }

  static Map<String, dynamic> _encodeRow(Map<String, dynamic> data) {
    return data.map((key, value) {
      if (value is DateTime) {
        return MapEntry(key, value.toIso8601String());
      }
      return MapEntry(key, value);
    });
  }
}
