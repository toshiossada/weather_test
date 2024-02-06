import 'dart:convert';

/// A class representing a cache model with an identifier, a timestamp, 
/// and associated data.
///
/// This model is used to represent cached data entries that include an [id], 
/// a [date] for
/// the timestamp, and the [data] itself, which is a map that can contain any 
/// type of data.
class CacheModel {
  // Usage:
  /// ```dart
  /// CacheModel(
  ///   id: 'unique_identifier',
  ///   date: DateTime.now(),
  ///   data: {'key': 'value'},
  /// );
  /// ```
  const CacheModel({
    required this.id,
    required this.date,
    required this.data,
  });

  /// The unique identifier for the cache entry.
  final String id;

  /// The date and time when the cache entry was created or last updated.
  final DateTime date;

  /// The actual data being cached.
  final Map<dynamic, dynamic> data;

  /// Converts the [CacheModel] instance into a [Map] with string keys and
  /// dynamic values.
  ///
  /// This method is useful for serializing the cache model to a format that
  /// can be easily
  /// stored or transmitted.
  ///
  /// Returns a [Map] representation of the [CacheModel].
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch,
      'data': data,
    };
  }

  /// Converts the [CacheModel] instance into a JSON string.
  ///
  /// This method leverages [toMap] to first convert the instance to a map,
  /// and then encodes
  /// it as a JSON string. It is useful for serialization to a string format f
  /// or storage or
  /// network transmission.
  ///
  /// Returns a JSON string representation of the [CacheModel].
  String toJson() => json.encode(toMap());
}
