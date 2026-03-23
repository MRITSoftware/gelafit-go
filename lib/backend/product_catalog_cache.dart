import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '/backend/supabase/supabase.dart';

class ProductCatalogCache {
  static const _featuredPrefix = 'catalog_featured_v1';
  static const _allPrefix = 'catalog_all_v1';

  static Future<List<GelaFitSuzanoRow>> loadFeaturedProducts({
    required String userRef,
  }) async {
    final cached = await getCachedFeaturedProducts(userRef: userRef);
    if (cached.isNotEmpty) {
      return cached;
    }
    return refreshFeaturedProducts(userRef: userRef);
  }

  static Future<List<GelaFitSuzanoRow>> loadAllProducts({
    required String userRef,
  }) async {
    final cached = await getCachedAllProducts(userRef: userRef);
    if (cached.isNotEmpty) {
      return cached;
    }
    return refreshAllProducts(userRef: userRef);
  }

  static Future<List<GelaFitSuzanoRow>> getCachedFeaturedProducts({
    required String userRef,
  }) =>
      _getCachedProducts(_featuredKey(userRef));

  static Future<List<GelaFitSuzanoRow>> getCachedAllProducts({
    required String userRef,
  }) =>
      _getCachedProducts(_allKey(userRef));

  static Future<List<GelaFitSuzanoRow>> refreshFeaturedProducts({
    required String userRef,
  }) async {
    final rows = await GelaFitSuzanoTable().queryRows(
      queryFn: (q) => q
          .eqOrNull('user_ref', userRef)
          .gtOrNull('quantidade', 0)
          .eqOrNull('destaque', true)
          .order('created_at', ascending: true),
    );
    await _saveProducts(_featuredKey(userRef), rows);
    return rows;
  }

  static Future<List<GelaFitSuzanoRow>> refreshAllProducts({
    required String userRef,
  }) async {
    final rows = await GelaFitSuzanoTable().queryRows(
      queryFn: (q) => q
          .eqOrNull('user_ref', userRef)
          .gtOrNull('quantidade', 0)
          .order('created_at', ascending: true),
    );
    await _saveProducts(_allKey(userRef), rows);
    return rows;
  }

  static Future<List<GelaFitSuzanoRow>> _getCachedProducts(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(key);
    if (raw == null || raw.isEmpty) {
      return <GelaFitSuzanoRow>[];
    }

    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) {
        return <GelaFitSuzanoRow>[];
      }

      return decoded
          .whereType<Map>()
          .map((item) => Map<String, dynamic>.from(item))
          .map(GelaFitSuzanoRow.new)
          .toList();
    } catch (_) {
      return <GelaFitSuzanoRow>[];
    }
  }

  static Future<void> _saveProducts(
    String key,
    List<GelaFitSuzanoRow> rows,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final payload = rows.map((row) => _encodeRow(row.data)).toList();
    await prefs.setString(key, jsonEncode(payload));
  }

  static Map<String, dynamic> _encodeRow(Map<String, dynamic> data) {
    return data.map((key, value) {
      if (value is DateTime) {
        return MapEntry(key, value.toIso8601String());
      }
      return MapEntry(key, value);
    });
  }

  static String _featuredKey(String userRef) => '$_featuredPrefix:$userRef';
  static String _allKey(String userRef) => '$_allPrefix:$userRef';
}
